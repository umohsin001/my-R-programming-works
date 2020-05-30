## barplot of RMG export earning from main apparel items & forecating the invidual export
## Author: Mohsin Uddin

## libraries
library(tidyverse)
library(forecast)

## reading data
data = read.csv(file.choose(), header = T)

## Plotting data
# facet 
ggplot(data, aes(year, export))+
  geom_bar(stat = "identity", color = "#141B15", fill = "#14D234")+
  facet_wrap(~item)

# grouped chart
ggplot(data, aes(year, export, fill = item))+
  geom_bar(stat = "identity", position = "dodge")+
  ggtitle("knit vs woven")

# stacked chart
ggplot(data, aes(year, export, fill = item))+
  geom_bar(stat = "identity", position = "stack")+
  ggtitle("knit vs woven")

# percentage stack chart
ggplot(data, aes(year, export, fill = item))+
  geom_bar(stat = "identity", position = "fill")+
  ggtitle("knit vs woven")

## Forecasting
# forecasting of knit export trend
df = data %>%
  filter(item == "knit") 
knit = ts(df$export, start = min(df$year), end = max(df$year))
arima1 = auto.arima(knit)
predict(arima1, n.ahead = 5, se.fit = T)
forecast1 = forecast(arima1, h = 5)
plot(forecast1, main = "knit export forecast")

# forecasting of woven export trend
dfw = data %>%
  filter(item == "woven") 
woven = ts(dfw$export, start = min(dfw$year), end = max(dfw$year))
arima2 = auto.arima(woven)
predict(arima2, n.ahead = 5, se.fit = T)
forecast2 = forecast(arima2, h = 5)
plot(forecast2, main = "woven export forecast")

