library("dplyr")

ai_ADAS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADAS.csv")
ai_ADS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADS.csv")

summary_info <- list()

# Count the number of observations in each dataset.

summary_info$num_observations_ADAS <- format(nrow(ai_ADAS_data), big.mark = ",")
summary_info$num_observations_ADS <- nrow(ai_ADS_data)

# Which companies have the most reported car crashes for ADS and ADAS? 
# If so, what were the most common causes for each crash?

summary_info$most_cars_ADAS <- ai_ADAS_data %>% 
  select(Make) %>% 
  group_by(Make) %>% 
  summarize(total_crashes = n()) %>% 
  arrange(-total_crashes) %>% 
  head(1)

summary_info$most_cars_ADS <- ai_ADS_data %>% 
  select(Make) %>% 
  group_by(Make) %>% 
  summarize(total_crashes = n()) %>% 
  arrange(-total_crashes) %>% 
  head(1)



# What type of roadway tends to have the most crashes? 
# What about the roadway surface (dry, ice, etc)?

summary_info$most_roadway_ADAS <- ai_ADAS_data %>% 
  select(Roadway.Type) %>% 
  filter(Roadway.Type != "Unknown") %>% 
  group_by(Roadway.Type) %>% 
  summarize(total_crashes = n()) %>% 
  arrange(-total_crashes) %>% 
  head(1) %>% 
  pull(Roadway.Type)

summary_info$most_roadway_ADS <- ai_ADS_data %>% 
  group_by(Roadway.Type) %>% 
  summarize(total_crashes = n()) %>% 
  arrange(-total_crashes) %>% 
  head(1) %>%
  pull(Roadway.Type)

summary_info$most_surface_ADAS <- ai_ADAS_data %>% 
  select(Roadway.Surface) %>% 
  filter(Roadway.Surface != "Unknown") %>% 
  group_by(Roadway.Surface) %>% 
  summarize(total_crashes = n()) %>% 
  arrange(-total_crashes) %>% 
  head(1) %>% 
  pull(Roadway.Surface)

summary_info$most_surface_ADS <- ai_ADS_data %>% 
  group_by(Roadway.Surface) %>% 
  summarize(total_crashes = n()) %>% 
  arrange(-total_crashes) %>% 
  head(1) %>%
  pull(Roadway.Surface)

# What states have the most crashes? What kinds? 
# What does this say about the spread of automated car technology 
# in the United States? 

summary_info$most_state_ADAS <- ai_ADAS_data %>% 
  select(State) %>% 
  group_by(State) %>% 
  summarize(total_crashes = n()) %>% 
  arrange(-total_crashes) %>% 
  head(1) %>% 
  pull(State)

summary_info$most_state_ADS <- ai_ADS_data %>% 
  select(State) %>% 
  group_by(State) %>% 
  summarize(total_crashes = n()) %>% 
  arrange(-total_crashes) %>% 
  head(1) %>% 
  pull(State)
  
# What top 5 car models (and thus maker) have the most ADAS and ADS crashes?

summary_info$most_model_crashes_ADAS <- ai_ADAS_data %>% 
  group_by(Make, Model) %>% 
  summarize(total_crashes = n(), .groups = "keep") %>% 
  arrange(-total_crashes) %>% 
  head(1)

summary_info$most_model_crashes_ADS <- ai_ADS_data %>% 
  group_by(Make, Model) %>% 
  summarize(total_crashes = n(), .groups = "keep") %>% 
  arrange(-total_crashes) %>%
  head(1)