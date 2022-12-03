library(shiny)
library(tidyverse)
library(plotly)

# Read in the data
# ADAS
ai_ADAS_data <- read.csv("www/SGO-2021-01_Incident_Reports_ADAS.csv") 
# ADS
ai_ADS_data <- read.csv("www/SGO-2021-01_Incident_Reports_ADS.csv") 

# Rename some rows to avoid duplicates / increase readability in graphs 
ai_ADAS_data$Make <- gsub("Acrua", "Acura", ai_ADAS_data$Make)
ai_ADAS_data$Make <- gsub("Mercedes-Benz", "Mercedes", ai_ADAS_data$Make)
ai_ADAS_data$Make <- gsub("HYUNDAI", "Hyundai", ai_ADAS_data$Make)

ai_ADS_data$Make <- gsub("LExus", "Lexus", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("Kenworth Motor Truck Co", "Kenworth", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("Ligier Group", "Ligier", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("NAVYA", "Navya", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("INTERNATIONAL", "International", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("FREIGHTLINER", "Freightliner", ai_ADS_data$Make)
ai_ADS_data$City <- gsub("Sann Francisco", "San Francisco", ai_ADS_data$City)

server <- function(input, output) {
  
  ### INTRODUCTION CODE ###
  
  ### CHART 1 CODE ###

  output$chart_1_output <- renderPlotly({
    
    # Read data and remove rows where ADAS or ADS is NA (depends on what is graphed)
    crashes_per_location <- read.csv("www/crashes_per_location.csv") %>% 
      drop_na(input$chart_1_type_input)
    
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
      labs(title = "Distribution of Car Crash Locations in the US", color = "Total Crashes") +
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
  
  ### CHART 3 CODE ###
  
  ### SUMMARY CODE ###

}