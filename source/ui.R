library(shiny)
library(shinythemes)
library(plotly)
library(markdown)

ui <- navbarPage(
  theme = shinytheme("cerulean"),
  title = strong("A.I. Car Crash Analysis"),
  
  # INTRODUCTION PAGE
  tabPanel(
    title = strong("Introduction"),
  ),
  
  # CHART 1 PAGE
  tabPanel(
    title = strong("Chart 1"),
    selectInput(inputId = "chart_1_type_input", label = "Select ADAS or ADS",
                choices = c("ADAS", "ADS")),
    uiOutput("slider"),
    plotlyOutput(outputId = "chart_1_output"),
    p(span("Chart 1: A map depicting where ADAS and ADS crashes have happened around
      the United States. Users can select between the ADAS and ADS map using
           the select input, while the slider allows them to select the minimum
           number of crashes shown to make the map more readable."), style = "font-size: 16px"),
    hr(),
    p(span("The reason this graphic was chosen was for a better
           visualization on how A.I. car crashes are spread around the United
           States. The data itself doesn't quite show this as it is more
           organized around the type of car crashes, but it isn't prominent
           on where it happened as geographic features might be important
           in analyzing why A.I. car crashes might happen. Thus, the number of crashes
           is represented as a circle with the more intense red and larger
           circles indicating that more crashes have been reported at that 
           location."), style = "font-size: 14px")
  ),
  
  # CHART 2 PAGE
  tabPanel(
    title = strong("Chart 2"),
    
    selectInput("chart_2_type", label = "Choose ADAS / ADS", choices = c("ADAS", "ADS")),
    selectInput("Manufacturer", label = "Select Manufacturer", choices = manufacturer),
    plotlyOutput("chart_2"),
    p(span("Chart 2: The pie charts illustrate what types of car crash are most prevalent
           in ADAS and ADS in the United States. The user can select the manufacturer to see
           how the prevalence of crash types differ by their selection."), 
      style = "font-size: 16px"),
    hr(),
    p(span("The purpose of this visualization is to explore what types of car crashes happend 
           from AI authomobile technology in the United States. The data can further provide
           an insight to manufacturer of what are the potential car crashes based on ADAS or ADS
           and in which way the technology should develop to prevent them for customer's safety."),
      style = "font-size: 14px")
    
  ),
  
  # CHART 3 PAGE
  tabPanel(
    title = strong("Chart 3"),
    selectInput("Type", label = "Select ADS or ADAS", choices = c("ADAS", "ADS")),
    plotlyOutput(outputId = "chart_3"),
    hr(),
    p("These bar graphs depict which roadway types are most prevalent 
      in the crashes of ADAS and ADS in the United States. It is seen 
      that the most crashes for ADAS happens on the highway, while it 
      is on the intersection for ADS. The ADAS roadway types might be 
      the result that drivers like to turn on ADAS most likely when 
      they are on highways. For ADS, it might mean that these cars 
      struggle to identify red lights. This is important because it shows
      what manufactorers can do to better their products.")
  ),
  
  # SUMMARY PAGE
  tabPanel(
    title = strong("Summary")
  ),
  
  # REPORT PAGE
  tabPanel(
    title = strong("Report"),
    includeMarkdown("www/docs/p01-proposal.md")
  )
)