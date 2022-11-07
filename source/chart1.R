library("ggplot2")
library("plotly")
library("tidyverse")

ai_ADAS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADAS.csv") # ADAS (L1)
ai_ADS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADAS.csv") # ADAS (L1)

ai_data_US <- ai_ADAS_data %>% 
  select(Make, Model, City, State) %>% 
  filter(Make != "Tesla") %>% 
  group_by(Make) %>% 
  summarize(total_crashes = n())

ggplot(data = ai_data_US) +
  geom_col(mapping = aes(x = Make, y = total_crashes)) +
  labs(title = "Number of car crashes per make (ADAS)", x = "Make", y = "Total Crashes") 