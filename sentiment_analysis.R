# sentiment analysis of tweets
# author: Mohsin Uddin

#libraries
library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)

# reading data
data = read.csv(file.choose(), header = T)
tweets = iconv(data$text)

# sentiment score
s = get_nrc_sentiment(tweets)
head(s)

# barplot
barplot(colSums(s),
        las = 2,
        col = rainbow(10),
        ylab = "count",
        main = "sentiment analysis")
