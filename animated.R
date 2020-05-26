# making animated plots with R
# author: Mohsin U.
#library
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(gganimate)


#Reading Data
data = read.csv("covid.csv", header = T)

#Converting the dates into convenient format
datanew = data %>%
  mutate(date_confirmation = dmy(date_confirmation))

#Animating the time series plot with gganimate
datanew %>% group_by(date_confirmation) %>%
  summarise(count = n()) %>%
  mutate(cumulative = cumsum(count)) %>%
  ggplot(aes(date_confirmation, cumulative))+
  geom_line(color="red")+
  geom_point(size=1.5)+
  theme_bw()+
  ggtitle("Daily cases")+
  transition_reveal(cumulative)

#Completing Data
datanew$day = day(datanew$date_confirmation)
datanew$month = month(datanew$date_confirmation)

new = datanew %>%
  filter(month == 3) %>%
  group_by(day, country)%>%
  summarise(count = n())

new = data.frame(complete(new, day, country, fill = list(count=0)))

#Daily line polt
new %>% filter(country == "United States" |
           country == "France"|
           country == "Germany"|
           country == "United Kingdom") %>%
  ggplot(aes(day, count, group = country, color = country))+
  geom_line()+
  geom_point()+
  ggtitle("Line plot")

#Bar plot
new = datanew %>% filter(country == "United States" |
                 country == "France"|
                 country == "Germany"|
                 country == "United Kingdom") %>%
  filter(month == 2 | month == 3) %>%
  group_by(country, month)%>%
  summarise(count = n())

new %>%
  ggplot(aes(country, count, fill = country))+
  geom_bar(stat = "identity")+
  scale_y_log10()+
  ggtitle("Bar plot")+
  theme_bw()+
  guides(fill = F)
