library("ggplot2")
library("plotly")
library("tidyverse")

ai_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADAS.csv")

ai_data_weather <- ai_data %>% 
  select(Reporting.Entity)
