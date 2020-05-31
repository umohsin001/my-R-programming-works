# sentiment analysis
# by: Mohsin Uddin

library(tuber)
library(syuzhet)
library(ggplot2)

app_id = "xxxxxxxxxxxxxxxxxxxx"
app_secret = "xxxxxxxxxxxxxxxxx"
yt_oauth(app_id, app_secret)

## sentiment analysis of black widow final trailer's comment thread
# getting data from youtube 
blackwidow = get_comment_threads(filter = c(video_id = "ybji16u608U"))

# cleaning data
bw = iconv(blackwidow$textDisplay)

# sentiment analysis
s = get_nrc_sentiment(bw)
head(s)

# plotting result
barplot(colSums(s),
        las = 2,
        col = rainbow(10),
        ylab = "count",
        main = "black widow final trailer sentiment analysis")

# sentiment analysis of comments on video regarding spaceX
get_stats("Wn5HxXKQOjw")
com = get_comment_threads(filter = c(video_id = "Wn5HxXKQOjw"))


str(com)
senti = iconv(com$textDisplay)

s1 = get_nrc_sentiment(senti)
head(s1)

barplot(colSums(s1),
        las = 2,
        col = rainbow(10),
        ylab = "count",
        main = "sentiment analysis")
