library("ggplot2")
library("plotly")
library("tidyverse")
library("tidygeocoder")

ai_ADAS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADAS.csv") # ADAS (L1)
ai_ADS_data <- read.csv("../data/SGO-2021-01_Incident_Reports_ADS.csv") # ADAS (L1)

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

ai_data_US <- ai_ADAS_data %>% 
  select(Make, Model, City, State) %>% 
  filter(Make != "Tesla") %>% 
  group_by(Make) %>% 
  summarize(total_crashes = n())

plot <- ggplot(data = ai_data_US) +
  geom_col(mapping = aes(x = Make, y = total_crashes), fill = "red") +
  labs(title = "Number of car crashes per maker (ADAS)", 
       subtitle = "",
       caption = "",
       alt = "",
       x = "Maker", 
       y = "Total Crashes") +
  theme(
    axis.text.x = element_text(size = 6.5),
    axis.text.y = element_text(size = 16),
    axis.title.x = element_text(size = 20),
    axis.title.y = element_text(size = 20),
    # plot.background = element_blank(), # remove gray background
    # panel.grid.major = element_blank(), # remove major grid lines
    # panel.grid.minor = element_blank(), # remove minor grid lines
    # panel.border = element_blank() # remove border around plot
    )
ggplotly(plot)

# Plot 2

# API usage: Geocodio for geocoding locations to lat, long based on city, state
# Sys.setenv("GEOCODIO_API_KEY" = "e3666a46434a3ea3e414e24436f30ef46300fe4")
# Sys.setenv("GEOCODIO_API_KEY" = "25133ea329996236632211643a66aee2a3a36a3") Jenna's key
ADAS_crashes_per_location <- ai_ADAS_data %>%
  select(Make, City, State) %>% 
  filter(State != "UNK") %>% 
  geocode(city = City, state = State, lat = latitude , long = longitude, method = "geocodio") %>% 
  group_by(City, State, latitude, longitude) %>% 
  summarize(total_crashes = n(), .groups = "keep")

ADS_crashes_per_location <- ai_ADS_data %>% 
  select(Make, City, State) %>% 
  filter(State != "UNK") %>% 
  geocode(city = City, state = State, lat = latitude, long = longitude, method = "geocodio") %>% 
  group_by(City, State, latitude, longitude) %>%
  summarize(total_crashes = n(), .groups = "keep")

# Load a shapefile of U.S. states using ggplot's `map_data()` function
state_shape <- map_data("state")
# Create a blank map of U.S. states
map_plot_ADAS <- ggplot(state_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group),
    color = "black", # show state outlines
    fill = "#c6dbef",
    size = .1 # thinly stroked
  ) +
  geom_point(
    data = ADAS_crashes_per_location,
    mapping = aes(
      x = longitude, 
      y = latitude, 
      label = City, 
      label2 = State, 
      label3 = total_crashes, 
      color = total_crashes,
      size = total_crashes,
    )
  ) +
  scale_color_gradient2(low = "#fff7ec", mid = "#ef6548", high = "#7f0000") +
  scale_size_continuous(limits=c(1, 34), breaks=seq(1, 34, by=5)) +
  coord_map() # use a map-based coordinate system
  
map_plot_ADAS <- map_plot_ADAS + 
  labs(title = "Distribution of ADAS car crash locations in the US", color = "Total Crashes") +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank(), # remove border around plot
    legend.position = "top"
  )

ggplotly(map_plot_ADAS, tooltip = c("label", "label2", "label3"))

map_plot_ADS <- ggplot(state_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group),
    color = "black", # show state outlines
    fill = "#c6dbef",
    size = .1 # thinly stroked
  ) +
  geom_point(
    data = ADS_crashes_per_location,
    mapping = aes(
      x = longitude, 
      y = latitude, 
      label = City, 
      label2 = State, 
      label3 = total_crashes, 
      color = total_crashes,
      size = total_crashes,
    )
  ) +
  scale_color_gradient(low = "#ef6548", high = "#7f0000") +
  coord_map() # use a map-based coordinate system

map_plot_ADS <- map_plot_ADS + 
  labs(title = "Distribution of ADS car crash locations in the US", color = "Total Crashes") +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank(), # remove border around plot
    legend.position = "top"
  )

ggplotly(map_plot_ADS, tooltip = c("label", "label2", "label3"))

# Plot 3 (Heatmap of ADAS car crashes per state)

# ADAS_per_state <- ADAS_crashes_per_location %>% 
#   group_by(State) %>% 
#   summarize(total_crashes = n()) %>% 
#   geocode(state = State, lat = latitude, long = longitude, method = "geocodio") 
# 
# state_shape <- map_data("state")
# map_plot_ADAS_per_state <- ggplot(state_shape) +
#   geom_polygon(
#     mapping = aes(x = long, y = lat, group = group),
#     color = "white", # show state outlines
#     size = .1 # thinly stroked
#   ) + 
#   geom_polygon (
#     data = ADAS_per_state,
#     mapping = aes(x = longitude, y = latitude, fill = total_crashes)
#   ) +
#   coord_map()
# 
# ggplotly(map_plot_ADAS_per_state)
