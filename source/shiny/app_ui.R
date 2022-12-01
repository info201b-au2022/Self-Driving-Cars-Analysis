library(shiny)

ui <- navbarPage(
  
  title = strong("PROJECT NAME"),
  tabPanel(
    title = strong("Introduction"),
  ),
  tabPanel(
    title = "Chart 1"
  ),
  tabPanel(
    title = "Chart 2"
  ),
  tabPanel(
    title = "Chart 3"
  ),
  tabPanel(
    title = "Summary"
  ),
  tabPanel(
    title = "Report"
  )
)