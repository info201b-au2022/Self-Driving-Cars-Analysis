library("dplyr")

ai_ADAS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADAS.csv")
View(ai_ADAS_data)
ai_ADS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADS.csv")
View(ai_ADS_data)

# Total counts
num_ADAS <- nrow(ai_ADAS_data)
num_ADS <- nrow(ai_ADS_data)

# What type of roadway tends to have the most crashes? What about the roadway surface (dry, ice, etc)?


# What type of car crash is most prevalent in ADS vs ADAS? What might be the cause of this?


# Which companies have the most reported car crashes for ADS and ADAS? If so, what were the most common causes for each crash?
most_car_ADAS <- names(which.max(table(ai_ADAS_data$Make)))
most_car_ADS <- names(which.max(table(ai_ADS_data$Make)))

# What states have the most crashes? What kinds? What does this say about the spread of automated car technology in the United States? How does it compare with crashes occurred by non-self driving cars?
most_state_ADAS <- names(which.max(table(ai_ADAS_data$State)))
most_state_ADS <- names(which.max(table(ai_ADS_data$State)))
                        