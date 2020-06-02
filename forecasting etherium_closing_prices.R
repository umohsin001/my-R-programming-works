# forecasting etherium closing prices

# libraries
library(prophet)
library(lubridate)
library(ggplot2)

# reading data
data = read.csv(file.choose(), header = T)
str(data)
head(data)

# cleaning data
data$Date = dmy(data$Date)

qplot(Date, Close, data = data, main = "Etherium closing prices")

# preparing data
ds = data$Date
y = log(data$Close)
df = data.frame(ds, y)

qplot(ds, y, data = df, main = "Etherium closing price in log")

# forecasting data
m = prophet(df)
future = make_future_dataframe(m, periods = 365)
forecast = predict(m, future)
plot(m, forecast)
prophet_plot_components(m, forecast)
