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

# Table 3: Number of ADAS crashes per roadway type

ai_ADAS_roadway <- ai_ADAS_data %>% 
  select(Roadway.Type) %>% 
  filter(Roadway.Type != "") %>%
  filter(Roadway.Type != "Unknown") %>%
  group_by(Roadway.Type) %>% 
  summarize(total_crashes = n()) %>% 
  rename("Total Crashes" = total_crashes)

# Table 4: Number of ADS crashes per roadway type

ai_ADS_roadway <- ai_ADS_data %>% 
  select(Roadway.Type) %>% 
  filter(Roadway.Type != "") %>%
  filter(Roadway.Type != "Unknown") %>%
  group_by(Roadway.Type) %>% 
  summarize(total_crashes = n()) %>% 
  rename("Total Crashes" = total_crashes)

# Table 5: Number of ADAS crashes per roadway surface

ai_ADAS_surface <- ai_ADAS_data %>% 
  select(Roadway.Surface) %>% 
  filter(Roadway.Surface != "") %>%
  filter(Roadway.Surface != "Unknown") %>%
  group_by(Roadway.Surface) %>% 
  summarize(total_crashes = n()) %>% 
  rename("Total Crashes" = total_crashes)

# Table 6: Number of ADS crashes per roadway surface

ai_ADS_surface <- ai_ADS_data %>% 
  select(Roadway.Surface) %>% 
  filter(Roadway.Surface != "") %>%
  filter(Roadway.Surface != "Unknown") %>%
  group_by(Roadway.Surface) %>% 
  summarize(total_crashes = n()) %>% 
  rename("Total Crashes" = total_crashes)

# Table 7: Number of ADAS crashes per state

ai_ADAS_state <- ai_ADAS_data %>% 
  select(State) %>% 
  group_by(State) %>% 
  summarize(total_crashes = n()) %>% 
  rename("Total Crashes" = total_crashes)

# Table 8: Number of ADS crashes per state

ai_ADS_state <- ai_ADS_data %>% 
  select(State) %>% 
  filter(State != "") %>% 
  group_by(State) %>% 
  summarize(total_crashes = n()) %>% 
  rename("Total Crashes" = total_crashes)


