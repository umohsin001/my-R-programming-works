# how to make a wordcloud in R
# author: Mohsin U.
#read file
tf = read.csv("wordcloud - Sheet1.csv", header = T)

#library
library(tm)
library(wordcloud)

# corpus
corpus = iconv(tf$Text)
corpus = Corpus(VectorSource(corpus))
inspect(corpus[1:5])

# text cleaning
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeNumbers)
corpus = tm_map(corpus, stripWhitespace)
inspect(corpus[1:5])

#term document matrix
tdm = TermDocumentMatrix(corpus)
tdm = as.matrix(tdm)

# bar plot
w = rowSums(tdm)
barplot(w,
        las = 2,
        col = rainbow(50))

# wordcloud
w = sort(rowSums(tdm), decreasing = T)
set.seed(222)
wordcloud(words = names(w),
          freq = w,
          max.words = 100,
          min.freq = 2,
          scale = c(2, 0.3))
