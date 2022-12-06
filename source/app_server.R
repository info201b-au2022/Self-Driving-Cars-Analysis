library(shiny)
library(tidyverse)
library(plotly)
library(maps)
library(mapproj)

server <- function(input, output) {
  
  ### INTRODUCTION CODE ###
  
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

  output$chart_2_adas <- renderPlotly({
    
    adas_crash_type <- ai_ADAS_data %>%
      filter(Make == input$Manufacturer) %>%
      select(Crash.With) %>%
      group_by(Crash.With) %>%
      summarise(count = n()) %>%
      arrange(desc(count))
    
    p_adas <- plot_ly(
      data = adas_crash_type, 
      labels = ~Crash.With, 
      values = ~count, 
      type = 'pie'
    ) %>%
      layout(title = paste0(input$Manufacturer, "'s ADAS Crash Type"))
    
  })
  
  output$chart_2_ads <- renderPlotly({
    
    ads_crash_type <- ai_ADS_data %>%
      filter(Make == input$Manufacturer) %>%
      select(Crash.With) %>%
      group_by(Crash.With) %>%
      summarise(count = n()) %>%
      arrange(desc(count))
    
    p_ads <- plot_ly(
      data = ads_crash_type, 
      labels = ~Crash.With, 
      values = ~count, 
      type = 'pie'
    ) %>%
      layout(title = paste0(input$Manufacturer, "'s ADS Crash Type"))
    
  })
  
  ### CHART 3 CODE ###
  
  ### SUMMARY CODE ###

}