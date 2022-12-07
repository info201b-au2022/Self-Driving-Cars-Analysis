library(shiny)
library(tidyverse)
library(plotly)
library(maps)
library(mapproj)

server <- function(input, output) {
  
  ### CHART 1 CODE ###
  crashes_per_location <- read.csv("www/crashes_per_location.csv")
  
  # I implement the input slider here because the max value is dependent on the dataset
  output$slider <- renderUI({
    sliderInput(inputId = "chart1_slider_input", label = "Minimum number of crashes to show",
                min = 0,
                max = max(crashes_per_location[input$chart_1_type_input], na.rm = TRUE),
                value = 0,
                step = 1)
  })

  output$chart_1_output <- renderPlotly({
    
    # Read data and remove rows where ADAS or ADS is NA (depends on what is graphed)
    crashes_per_location <- crashes_per_location %>% 
      drop_na(input$chart_1_type_input)
    
    # Filter my minimum number of crashes based on slider input
    crashes_per_location <- filter(crashes_per_location,
                                   crashes_per_location[[input$chart_1_type_input]] 
                                   >= input$chart1_slider_input)
      
    # Load a shapefile of U.S. states using ggplot's `map_data()` function
    state_shape <- map_data("state")
    # Create a blank map of U.S. states
    chart1_plot <- ggplot(state_shape) +
      geom_polygon(
        mapping = aes(x = long, y = lat, group = group),
        color = "black", # show state outlines
        fill = "#c6dbef",
        size = .1 # thinly stroked
      ) +
      geom_point(
        data = crashes_per_location,
        mapping = aes(
          x = longitude, 
          y = latitude, 
          label = .data$City, 
          label2 = .data$State, 
          label3 = .data[[input$chart_1_type_input]],
          color = .data[[input$chart_1_type_input]],
          size = .data[[input$chart_1_type_input]])
      ) +
      scale_color_gradient2(low = "#fff7ec", mid = "#ef6548", high = "#7f0000") +
      scale_size_continuous() +
      coord_map() + # use a map-based coordinate system  
      labs(title = paste("Distribution of", input$chart_1_type_input ,"Car Crash Locations in the US"), 
           color = "Total Crashes",
           caption = "Source: NHTSA") +
      theme(
        axis.line = element_blank(), # remove axis lines
        axis.text = element_blank(), # remove axis labels
        axis.ticks = element_blank(), # remove axis ticks
        axis.title = element_blank(), # remove axis titles
        plot.background = element_blank(), # remove gray background
        panel.grid.major = element_blank(), # remove major grid lines
        panel.grid.minor = element_blank(), # remove minor grid lines
        panel.border = element_blank(), # remove border around plot
        panel.background = element_blank(),
        legend.position = "top"
      )
      chart1_plot <- ggplotly(chart1_plot, tooltip = c("label", "label2", "label3"))
      return(chart1_plot)
  })
  
  ### CHART 2 CODE ###

  output$chart_2 <- renderPlotly({
    
    adas_crashes_make <- ai_ADAS_data %>% 
      select(Make, Crash.With) %>%
      filter(Crash.With != "Other, see Narrative") %>% 
      filter(Crash.With != "Unknown") %>% 
      group_by(Make, Crash.With) %>%
      summarise(count = n()) %>%
      arrange(desc(count))
    
    ads_crashes_make <- ai_ADS_data %>%
      select(Make, Crash.With) %>%
      filter(Crash.With != "Other, see Narrative") %>% 
      filter(Crash.With != "Unknown") %>% 
      group_by(Make, Crash.With) %>%
      summarise(count = n()) %>%
      arrange(desc(count))
    
    # If we want to plot by a single manufacturer
    if(input$Manufacturer != "Overall") {
      adas_crashes_make <- ai_ADAS_data %>%
        filter(Make == input$Manufacturer) %>%
        select(Crash.With) %>%
        group_by(Crash.With) %>%
        summarise(count = n()) %>%
        arrange(desc(count))
      
      ads_crash_make <- ai_ADS_data %>%
        filter(Make == input$Manufacturer) %>%
        select(Crash.With) %>%
        group_by(Crash.With) %>%
        summarise(count = n()) %>%
        arrange(desc(count))
    } 
    
    adas_crashes_make <- rename(adas_crashes_make, "ADAS" = "count")
    ads_crashes_make <- rename(ads_crashes_make, "ADS" = "count")
    crashes_per_type <- bind_rows(adas_crashes_make, ads_crashes_make)
    crashes_per_type <- drop_na(crashes_per_type, input$chart_2_type)

    pplot <- plot_ly(
      data = crashes_per_type, 
      labels = ~Crash.With, 
      values = ~.data[[input$chart_2_type]], 
      type = 'pie'
    ) %>%
      layout(title = paste0(input$Manufacturer, " ", input$chart_2_type, " Type of Crashes"))
  })
  
  ### CHART 3 CODE ###
  
  output$chart_3 <- renderPlotly({
    
    ADAS_roadway_crashes <- ai_ADAS_data %>%
      select(Roadway.Type) %>%
      filter(Roadway.Type != "Unknown") %>%
      group_by(Roadway.Type) %>%
      summarize(crashes = n()) %>% 
      rename("ADAS" = "crashes") 

    ADS_roadway_crashes <- ai_ADS_data %>%
      select(Roadway.Type) %>%
      filter(Roadway.Type != "Unknown",
             Roadway.Type != "") %>%
      group_by(Roadway.Type) %>%
      summarize(crashes = n()) %>%  
      rename("ADS" = "crashes")
    
    roadway_crashes <- bind_rows(ADAS_roadway_crashes, ADS_roadway_crashes) %>% 
      drop_na(input$Type)
    
    roadway_type_plot <- ggplot(roadway_crashes, aes(x = .data[[input$Type]], y = Roadway.Type)) +
      geom_col(aes(fill = Roadway.Type,
               label = .data$Roadway.Type,
               label2 = .data[[input$Type]])) +
      labs(
        x = "Number of crashes", y = "Types of roadways",
        title = paste(input$Type, "Amount of Crashes per Roadway Type"),
        fill = "Roadway Type"
      ) 
    roadway_plot <- ggplotly(roadway_type_plot, tooltip = c("label", "label2"))
    return(roadway_plot)
  })
}