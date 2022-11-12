library (tidyverse)
library(dplyr)

# Research Question 2: 
# What type of car crash is most prevalent in ADS vs ADAS? What might be the cause of this?
# Comparing technologies is essential to visualize how they will perform in the future, 
# as well as predict how consumers will react to them. For example, should consumers feel safer 
# moving to ADS (the prototype “no-hands” AI driving experience) or will ADAS 
# (the current one in the market) remain the most popular? As such, we are motivated to find out 
# whether ADS are safe enough to hype up, or if ADAS will remain to stay.

adas <- read.csv("https://raw.githubusercontent.com/info201b-au2022/Self-Driving-Cars-Analysis/main/data/SGO-2021-01_Incident_Reports_ADAS.csv")
ads <- read.csv("https://raw.githubusercontent.com/info201b-au2022/Self-Driving-Cars-Analysis/main/data/SGO-2021-01_Incident_Reports_ADS.csv")

# input: dataframe 
# return: dataframe with Crash.With column
result <- function(df) {
  
  crash <- df %>%
    select(Crash.With) %>%
    group_by(Crash.With) %>%
    summarise(count = n()) %>%
    arrange(desc(count))
  
  crash
}

adas_temp <- result(adas) 
ads_temp <- result(ads)

# from temp files
# create Other type and filter out rows grouped into Other 
adas_other <- adas_temp %>%
  add_row(Crash.With = "Truck", count = sum(adas_temp$count[8:9]))%>%
  arrange(desc(count)) %>%
  add_row(Crash.With = "Other", count = sum(adas_temp$count[11:15])) %>%
  arrange(desc(count)) %>%
  slice(1:12) %>%
  filter(Crash.With != "Other, see Narrative") %>%
  filter(Crash.With != "Pickup Truck") %>%
  filter(Crash.With != "Heavy Truck")  %>% 
  filter(Crash.With != "Unknown")

ads_other <- ads_temp %>%
  add_row(Crash.With = "Other", count = sum(ads_temp$count[10:15])) %>%
  arrange(desc(count)) %>%
  slice(1:10) %>%
  filter(Crash.With != "Other, see Narrative") %>% 
  filter(Crash.With != "Unknown")

# input : dataframe with Other type
# return : dataframe with type and percentages 
make_percentage <- function(df) {
  
  df_w_percentage <- df %>%
    mutate(percentage = round(count / sum(adas_temp$count), 2)) %>%
    rename("type" = "Crash.With") %>% 
    select(type, percentage)
  
  df_w_percentage
}

adas_crash <- make_percentage(adas_other) 
ads_crash <- make_percentage(ads_other)

# Create pie chart
library("ggplot2")

adas_pie_chart <- ggplot(data = adas_crash, aes(x = "", y = percentage, fill = type)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(percentage * 100, "%")), position = position_stack(vjust = 0.5)) + 
  theme_void() +
  labs(
    x = NULL,
    y = NULL,
    fill = "Type of crash",
    title = "Types of Crashes for ADAS vehicles",
    caption = "Source: NHTSA"
  )
                          
  

ads_pie_chart <- ggplot(data = ads_crash, aes(x = "", y = percentage, fill = type)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  geom_text(aes(label = paste0(percentage * 100, "%")), position = position_stack(vjust = 0.5)) + 
  theme_void() +
  labs(
    x = NULL,
    y = NULL,
    fill = "Type of crash",
    title = "Types of Crashes for ADS vehicles",
    caption = "Source: NHTSA"
  )


