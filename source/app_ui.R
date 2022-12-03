library(shiny)
library(plotly)
library(markdown)

ui <- navbarPage(
  title = strong("PROJECT NAME"),
  tabPanel(
    title = strong("Introduction"),
  ),
  tabPanel(
    title = "Chart 1",
    selectInput(inputId = "chart_1_type_input", label = "Select ADAS or ADS",
                choices = c("ADAS", "ADS")),
    plotlyOutput(outputId = "chart_1_output")
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
    title = "Report",
    includeMarkdown("www/docs/p01-proposal.md")
  )
)