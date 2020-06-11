# virtual intership task 1 at ANZ
# by: Mohsin Uddin

# libraries
library(tidyverse)

# read data
data1 = read.csv(file.choose(), header = T)

# missing values
sapply(data1, function(x) sum(is.na(x)))
head(data1$merchant_state)

# avg txn amount
mean(data1$amount)

# txn in each month
ggplot(data1, aes(month, fill = month))+
  geom_bar()+
  xlab("Month")+
  ylab("No. of transaction")+
  ggtitle("No. of transaction in each month")

# spending in each month
ggplot(data1, aes(month, amount, fill = month))+
  geom_bar(stat = "identity")+
  xlab("Month")+
  ylab("Transaction amount")+
  ggtitle("Spending amount in each month")

# male vs female
ggplot(data1, aes(gender, fill = gender))+
  geom_bar()+
  xlab("Gender")+
  ylab("No. of user")+
  ggtitle("Male users vs Female users")

# txn description
data1$txn_description[data1$txn_description == "SALES-POS"] = "POS"
ggplot(data1, aes(txn_description, fill = txn_description))+
  geom_bar()+
  xlab("Method")+
  ylab("Count")+
  ggtitle("Point where transaction took place")

# average age
mean(data1$age) # 30-31 years
d = data1%>%
  group_by(age)%>%
  summarise(count = n())%>%
  arrange(desc(age))
d2 = data.frame(Age_range = c("20 or less", "21-30", "31-40", "41-50", "50 or more") , 
                count = c(1900, 5071, 3405, 1293, 374))
ggplot(d2, aes(Age_range, count, fill = Age_range))+
  geom_bar(stat = "identity")+
  xlab("Age range")+
  ylab("No. of user")+
  ggtitle("Customer's age range")

# customer with most txn
d = data1%>%
  group_by(first_name)%>%
  summarise(count = n())%>%
  arrange(desc(count))
d1 = d[1:5,]
ggplot(d1, aes(first_name, count, fill = first_name))+
  geom_bar(stat = "identity")+
  xlab("Customer")+
  ylab("No. of transaction made")+
  ggtitle("Customers who made most transactions")
