# Author: Mohsin Uddin
# library
library(tidyverse)

# making a data frame
specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
value <- abs(rnorm(12 , 0 , 15))
data <- data.frame(specie,condition,value)

str(specie)

# grouped barplot
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="dodge", stat="identity")

# stacked barplot
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="stack", stat="identity")

# percentage stack barplot
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="fill", stat="identity")

# facet wrap
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="dodge", stat="identity")+
  facet_wrap(~specie)

# working with diamond data frame
df = diamonds

# max(df$price)
# [1] 18823
# sum(diamonds$depth > 60)
# [1] 48315
# sum(diamonds$price == 15000)
# [1] 1

# histogram
ggplot(data=diamonds) + 
  geom_histogram(binwidth=500, aes(price)) + 
  ggtitle("Diamond Price Distribution") + 
  xlab("Diamond Price US$") + 
  ylab("Frequency") + 
  theme_minimal()

# histogram with facet wrap
ggplot(data=diamonds) + 
  geom_histogram(binwidth=10, aes(price)) + 
  ggtitle("Diamond Price Distribution") + 
  xlab("Diamond Price U$ - Binwidth 500") + 
  ylab("Frequency") + 
  theme_minimal() + 
  xlim(0,2500)+
  facet_wrap(~cut)
