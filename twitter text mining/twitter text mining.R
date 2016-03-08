#####################################
#########twitter tweet mining

#install packages if not installed 
#install.packages("RCurl")
#install.packages("twitteR")
#install.packages("ROAuth")
#install.packages("base64enc")
#install.packages("tm")
#install.packages("wordcloud")

library(bitops)
library(RCurl)
library(twitteR)
library(ROAuth)
library(base64enc)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)


apiKey      <- "xxxxxxxxxxxxxxxxxxxxxxxx"
apiSecret   <- "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
accessToken <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
accessSecret<- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

setup_twitter_oauth(apiKey,apiSecret,access_token=accessToken,access_secret=accessSecret)




linux <- searchTwitter("#Linux",n = 500,lang="en",resultType="recent")
linux.text = sapply(linux, function(x) x$getText())
linux.text.corpus = Corpus(VectorSource(linux.text))


linux.clean<-tm_map(linux.text.corpus,removePunctuation)
linux.clean<-tm_map(linux.clean,content_transformer(tolower))
linux.clean<-tm_map(linux.clean,removeWords,c("linux","...","https","http"))
linux.clean<-tm_map(linux.clean,removeWords,stopwords("english"))
linux.clean<-tm_map(linux.clean,removeNumbers)
linux.clean<-tm_map(linux.clean,stripWhitespace)


tdm<-TermDocumentMatrix(linux.clean)
matrix.data = as.matrix(tdm)

# get word counts in decreasing order
word_freqs = sort(rowSums(matrix.data), decreasing = TRUE) 

# create a data frame with words and their frequencies
dm = data.frame(word = names(word_freqs), freq = word_freqs)
dm<-dm[1:100,]
wordcloud(dm$word, dm$freq, random.order = FALSE,colors=topo.colors(100))