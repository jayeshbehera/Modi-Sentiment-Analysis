
install.packages("SnowballC")
install.packages("twitteR")
install.packages("syuzhet")

#Packages Required

library("SnowballC")
library("twitteR")
library("syuzhet")

#For the Keys You need a Twitter Developer Account. Apply at https://apps.twitter.com/ to get the keys.
 

consumer_key <- 'r0aEwIVGPzbyL2GF86n2PURGv'
consumer_secret <- 'szfLh1q18eKlVJT2ECWnO1G7sqY0O2SfjYfy1UEX28Eyz5UlpF'
access_token <- '2945374159-VFnclbH1D2hUGuxklk1hA0eRErFGJ1gwvrk9Es6'
access_secret <- 'fAKok7F3I8spolOtcu4kskiF61XZemmcwhnRx4Tn4MJnB'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets <- userTimeline("narendramodi", n=250)

n.tweet <- length(tweets)

tweets.df <- twListToDF(tweets) 
head(tweets.df)

tweets.df2 <- gsub("http.*","",tweets.df$text)

tweets.df2 <- gsub("https.*","",tweets.df2)

tweets.df2 <- gsub("#.*","",tweets.df2)

tweets.df2 <- gsub("@.*","",tweets.df2)

head(tweets.df2)

word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)

emotion.df2 <- cbind(tweets.df2, emotion.df) 

head(emotion.df2)
word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)

emotion.df2 <- cbind(tweets.df2, emotion.df) 

head(emotion.df2)

head(emotion.df2)


sent.value <- get_sentiment(word.df)

most.positive <- word.df[sent.value == max(sent.value)]

most.positive
sent.value <- get_sentiment(word.df)

most.positive <- word.df[sent.value == max(sent.value)]

most.positive

most.negative <- word.df[sent.value <= min(sent.value)] 
most.negative 

most.negative

sent.value

positive.tweets <- word.df[sent.value > 0] 
head(positive.tweets)

negative.tweets <- word.df[sent.value < 0]
head(negative.tweets)

neutral.tweets <- word.df[sent.value == 0] 
head(neutral.tweets)
