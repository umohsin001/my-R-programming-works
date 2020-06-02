# creating dataframe & visualizing with ggplot
# by: Mohsin Uddin

# libraries
library(ggplot2)

# making dataframes

data = data.frame (ten  = c("1st", "2nd","3rd", "4th", "5th"),
                   days = c(58, 11, 7, 6, 5)
df = data.frame (hundred  = c("1st", "2nd","3rd", "4th", "5th", "6th", "7th"),
                  days = c(44, 18, 8, 5, 4, 5, 3))

head(data)
head(df)

# plotting
ggplot(data, aes(ten, days))+
  geom_bar(stat = "identity", fill = "red")+
  xlab("Thousands")+
  ylab("days")+
  ggtitle("Days for every 10 thousand cases")

ggplot(df, aes(hundred, days))+
  geom_bar(stat = "identity", fill = "orange")+
  xlab("Hundreds")+
  ylab("days")+
  ggtitle("Days for every 100 deaths")
