# forecasting the views of John Cena's page on wikipedia
# author: Mohsin U.
library(wikipediatrend)
library(prophet)
JC = wp_trend(page = "John_Cena",
         from = "2017-01-01",
         to = "2019-12-31")
library(ggplot2)
qplot(date, views,data = JC)
ds = JC$date
y = log(JC$views)
data = data.frame(ds, y)
qplot(ds, y, data = data)
m = prophet(data)
future = make_future_dataframe(m, periods = 365)
forecast = predict(m, future)
plot(m, forecast, title = "John Cena's view forecated")
prophet_plot_components(m, forecast)
