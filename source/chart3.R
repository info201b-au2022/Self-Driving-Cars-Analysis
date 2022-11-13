# load ggplot2 and dpylr
library("ggplot2")
library("dplyr")

# upload files
ADAS <- read.csv("https://raw.githubusercontent.com/info201b-au2022/Self-Driving-Cars-Analysis/main/data/SGO-2021-01_Incident_Reports_ADAS.csv")
ADS <- read.csv("https://raw.githubusercontent.com/info201b-au2022/Self-Driving-Cars-Analysis/main/data/SGO-2021-01_Incident_Reports_ADS.csv")

# Total amount of crashes, excluding unknown?
total_roadway_crashes <- ADAS %>%
  select(Roadway.Type) %>%
  filter(Roadway.Type != "Unknown") %>%
  summarize(total_crashes = n()) %>%
  pull(total_crashes)

# amount of crashes per roadway type; ADAS
ADAS_roadway_crashes <- ADAS %>%
  select(Roadway.Type) %>%
  filter(Roadway.Type != "Unknown") %>%
  group_by(Roadway.Type) %>%
  summarize(
    crashes = n()
  )

# amount of crashes per roadway type; ADS
ADS_roadway_crashes <- ADS %>%
  select(Roadway.Type) %>%
  filter(Roadway.Type != "Unknown") %>%
  group_by(Roadway.Type) %>%
  summarize(
    crashes = n()
  )

# amount of crashes per roadway surface; ADAS
ADAS_roadway_surface <- ADAS %>% 
  select(Roadway.Surface) %>% 
  filter(Roadway.Surface != "Unknown") %>% 
  group_by(Roadway.Surface) %>% 
  summarize(
    crashes = n()
  )

# amount of crashes per roadway surface; ADS
ADS_roadway_surface <- ADS %>% 
  select(Roadway.Surface) %>% 
  filter(Roadway.Surface != "Unknown") %>% 
  group_by(Roadway.Surface) %>% 
  summarize(
    crashes = n()
  )


# bar graph for ADAS roadway type crashes
ADAS_roadway_type <- ggplot(ADAS_roadway_crashes, aes(x = crashes, y = Roadway.Type)) +
  geom_col(aes(fill = Roadway.Type)) +
  geom_text(aes(label = crashes)) +
  labs(
    x = "Number of crashes", y = "Types of roadways",
    title = "Amount of Crashes per Roadway Type"
  )

# bar graph for ADS roadway type crashes
ADS_roadway_type <- ggplot(ADS_roadway_crashes, aes(x = crashes, y = Roadway.Type)) +
  geom_col(aes(fill = Roadway.Type)) +
  geom_text(aes(label = crashes)) +
  labs(
    x = "Number of crashes", y = "Types of Roadways",
    title = "Amount of Crashes per Roadway Type"
  )

# bar graph for ADAS roadway surface crashes
ADAS_roadway_surface_crashes <- ggplot(ADAS_roadway_surface, aes(x = crashes, y = Roadway.Surface)) +
  geom_col(aes(fill = Roadway.Surface)) + 
  geom_text(aes(label = crashes)) +
  labs(
    x = "Number of crashes", y = "Types of Roadway Surfaces",
    title = "Amount of crashes per Roadway Surface"
  )


# bar graph for ADS roadway surface crashes
ADS_roadway_surface_crashes <- ggplot(ADS_roadway_crashes, aes(x = crashes, y = Roadway.Surface)) +
  geom_col(aes(fill = Roadway.Surface)) +
  geom_text(aes(label = crashes)) +
  labs(
    x = "Number of crashes", y = "Types of Roadway Surfaces",
    title = "Amount of Crashes per Roadway Surface"
  )