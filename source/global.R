# Read in the data
# ADAS
ai_ADAS_data <- read.csv("www/SGO-2021-01_Incident_Reports_ADAS.csv") 
# ADS
ai_ADS_data <- read.csv("www/SGO-2021-01_Incident_Reports_ADS.csv") 

# Rename some rows to avoid duplicates / increase readability in graphs 
ai_ADAS_data$Make <- gsub("Acrua", "Acura", ai_ADAS_data$Make)
ai_ADAS_data$Make <- gsub("Mercedes-Benz", "Mercedes", ai_ADAS_data$Make)
ai_ADAS_data$Make <- gsub("HYUNDAI", "Hyundai", ai_ADAS_data$Make)

ai_ADS_data$Make <- gsub("LExus", "Lexus", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("Kenworth Motor Truck Co", "Kenworth", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("Ligier Group", "Ligier", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("NAVYA", "Navya", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("INTERNATIONAL", "International", ai_ADS_data$Make)
ai_ADS_data$Make <- gsub("FREIGHTLINER", "Freightliner", ai_ADS_data$Make)
ai_ADS_data$City <- gsub("Sann Francisco", "San Francisco", ai_ADS_data$City)

# Make vector of manufacturer 
adas_manufacturer <- unique(ai_ADAS_data$Make)
ads_manufacturer <- unique(ai_ADS_data$Make)
manufacturer <- c("Overall")
manufacturer <- append(manufacturer, unique(c(adas_manufacturer, ads_manufacturer)))
