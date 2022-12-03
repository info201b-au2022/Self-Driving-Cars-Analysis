library(shiny)

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
  
  ### REPORT CODE ####
  output$report_table <- renderUI({
    HTML("
    <style>
      table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
      }
      table {
        background-color: #DBE1F1;
        width: 1000px;
      }
      th, td {
        padding: 10px;
      }
    </style>
    <table>
      <tr>
        <th>Element</th>
        <th>Brief Description</th>
      </tr>
      <tr>
        <td>Code Name</td>
        <td>car-crash-2021</td>
      </tr>
      <tr>
        <td>Project Title</td>
        <td>Self-Driving Cars: How Safe Are They?</td>
      </tr>
      <tr>
        <td>Authors</td>
        <td>Trevor Tang (tangtr@uw.edu), 
        Jenna Moon-Earle (jmoone@uw.edu), Sukyung Tae (sukyung@uw.edu), 
        Yeji Kim (yk84@uw.edu)</td>
      </tr>
      <tr>
        <td>Affiliation</td>
        <td>INFO-201: Technical Foundations of Informatics - 
        The Information School - University of Washington</td>
      </tr>
      <tr>
        <td>Date</td>
        <td>Autumn 2022</td>
      </tr>
      <tr>
        <td>Abstract</td>
        <td>Our project will investigate certain crashes involving vehicles 
        equipped with <i>automatic driving systems</i> (<b>ADS</b>) / <i>automatic driving assisted systems</i> (<b>ADAS</b>) 
        so that consumers can obtain timely and transparent notifications of crashing incidents 
        associated with these vehicles from manufacturers and operators. 
        The purpose of our datasets is to provide information for the development 
        of new technologies and policies to enhance the safety of these technologies, 
        and our main question is to figure out the better option between self-driving vehicles 
        and non self-driving vehicles by examining the number of accidents, key factors that 
        affect the crashes (weather, geography, etc.), and effectiveness of new technologies and policies. 
        This question is important because it helps consumers to be informed whether 
        it's effective to buy ADS/ADAS cars or to avoid it if it doesn't perform well in the places they live. 
        We will analyze the cars with their technologies to visualize how they will perform so that consumers 
        can make better decisions. We recognize that the limitations of the data are crucial for accurate 
        interpretation and analysis, since the crash data did not include the capabilities depending on the brands 
        and manufacturers. To address this concern, we plan to keep in mind the variation in data recording and 
        collect the data by each vehicle’s companies as much as we can.</td>
      </tr>
    </table>")
  })
}