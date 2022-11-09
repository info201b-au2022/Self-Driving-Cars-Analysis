library("dplyr")

ai_ADAS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADAS.csv") # ADAS (L1)
ai_ADS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADS.csv") # ADAS (L1)


# Correcting typos / extras found in the data files to concise the dataset
ai_ADAS_data$Make <- gsub("Acrua", "Acura", ai_ADAS_data$Make)

ai_ADS_data$Make <- gsub("LExus", "Lexus", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("Kenworth Motor Truck Co", "Kenworth", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("Ligier Group", "Ligier", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("NAVYA", "Navya", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("INTERNATIONAL", "International", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("FREIGHTLINER", "Freightliner", ai_ADS_data$Make)


# Table 1: Number of ADAS crashes per manufacturer
ai_ADAS_crashes <- ai_ADAS_data %>% 
  select(Make) %>% 
  group_by(Make) %>% 
  summarize(total_crashes = n()) %>% 
  rename(Manufacturer = Make, "Total Crashes" = total_crashes)

# Table 2: Number of ADS crashes per manufacturer

ai_ADS_crashes <- ai_ADS_data %>% 
  select(Make) %>% 
  filter(Make != "") %>% 
  group_by(Make) %>% 
  summarize(total_crashes = n()) %>% 
  rename(Manufacturer = Make, "Total Crashes" = total_crashes)

