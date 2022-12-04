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
    title = strong("Chart 2")
  ),
  
  # CHART 3 PAGE
  tabPanel(
    title = strong("Chart 3")
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