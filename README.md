## Exploration of R Programming and Big Data Analytics
This repo includes examples code of big data analytic using R programming. 
- Basic R programming code
- Graph plotting code
- Text Mining code
- Web Mining Code


### Twitter text mining 
In this example, texts are curled using hashtag and cleansing stored texts. 

**Search using hashtag #Linux**

```R
linux <- searchTwitter("#Linux",n = 500,lang="en",resultType="recent")
linux.text = sapply(linux, function(x) x$getText())
linux.text.corpus = Corpus(VectorSource(linux.text))
```

**Cleaning Texts**
```R
linux.clean<-tm_map(linux.text.corpus,removePunctuation)
linux.clean<-tm_map(linux.clean,content_transformer(tolower))
linux.clean<-tm_map(linux.clean,removeWords,c("linux","...","https","http"))
linux.clean<-tm_map(linux.clean,removeWords,stopwords("english"))
linux.clean<-tm_map(linux.clean,removeNumbers)
linux.clean<-tm_map(linux.clean,stripWhitespace)
```

**Text into TMD**
```R
tdm<-TermDocumentMatrix(linux.clean)
matrix.data = as.matrix(tdm)
```

**WordCloud :"
[<img src="https://github.com/achyutdev/Exploration-of-R/blob/master/twitter%20text%20mining/twitterLinux.jpeg">](WordCloud)

