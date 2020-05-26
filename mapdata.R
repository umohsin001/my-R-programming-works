# map with R (incomplete)
# author: Mohsin U.
# useful libraries
library(leaflet)
library(tidyverse)
library(ggmap)
library(leaflet.extras)
library(htmltools)
library(ggplot2)
library(maps)
library(mapproj)
library(mapdata)
library(covid19.analytics)

# world map
w = map_data("world")
isf = map_data("world", region = c("Italy", "Spain", "France"))
bip = map_data("world", region = c("Bangladesh", "India", "Pakistan"))

ggplot(isf, aes(long, lat, group = group, fill = region))+
  geom_polygon(color = "black")+
  coord_map("polyconic")

ggplot(bip, aes(long, lat, group = group, fill = region))+
  geom_polygon(color = "black")+
  coord_map("polyconic")

# US states
s = map_data("state")
ggplot(s, aes(long, lat, group = group, fill = region))+
  geom_polygon(color = "black")+
  coord_map("polyconic")+
  guides(fill = F)

# COVID data USA
covid = read.csv("E:\\Mohsin important\\data science\\r programming\\covid.csv", header = T)
usa = covid %>% 
  filter(country == "United States") %>%
  group_by(province) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

# merge data
usa$province = tolower(usa$province)

data = merge(s, usa, by.x = "region", by.y = "province")

ggplot(data, aes(long, lat, group = group, fill = count))+
  geom_polygon(color = "black")+
  coord_map("polyconic")+
  scale_fill_gradient2(low = "white", high = "red")+
  ggtitle("COVID USA")

# leaflet DHAKA
leaflet() %>% 
  addProviderTiles("CartoDB") %>%
  setView(lng = 23.7641, lat = 90.4467, zoom = 2) %>%
  addMarkers(lng = 23.7641, lat = 90.4467)
