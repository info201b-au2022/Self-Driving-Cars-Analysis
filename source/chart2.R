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
  filter(Crash.With != "Heavy Truck") 

ads_other <- ads_temp %>%
  add_row(Crash.With = "Other", count = sum(ads_temp$count[10:15])) %>%
  arrange(desc(count)) %>%
  slice(1:10) %>%
  filter(Crash.With != "Other, see Narrative")

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


# create pie chart
#install.packages("plotrix")
library(plotrix)

create_pie <- function(df, name) {
  df_chart <- pie3D(df$percentage, labels = paste0(df$type), theta = 1.0, 
                    explode = 0.15, labelcex = 1, height = 0.07,
                    col=c("#C0392B","#8E44AD","#2471A3", "#5499C7","#16A085", "#58D68D", "#F4D03F", "#E67E22", "#F5B7B1"),
                    main = name)
  
  df_chart
}

adas_type_pie <- create_pie(adas_crash, "Type of ADAS Car Crashes")
ads_type_pie <- create_pie(ads_crash, "Type of ADS Car Crashes")



