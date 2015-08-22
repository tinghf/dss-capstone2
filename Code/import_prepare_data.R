# download data 
destination_file <- "Coursera-SwiftKey.zip"
source_file <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

# execute the download
download.file(source_file, destination_file)

# extract the files from the zip file
unzip(destination_file)

# load the stingi library for text manipulation
library(stringi)

# inspect the data
list.files("Coursera-SwiftKey/final",, recursive=TRUE)

# import the blogs and twitter datasets in text mode
blogs <- readLines("Coursera-SwiftKey/final/en_US/en_US.blogs.txt", encoding="UTF-8")
twitter <- readLines("Coursera-SwiftKey/final/en_US/en_US.twitter.txt", encoding="UTF-8")


# import the news dataset in binary mode, to avoid import errors 
con <- file("Coursera-SwiftKey/final/en_US/en_US.news.txt", open="rb")
news <- readLines(con, encoding="UTF-8")
close(con)
rm(con)

# drop non UTF-8 characters
twitter <- iconv(twitter, from = "latin1", to = "UTF-8", sub="")
twitter <- stri_replace_all_regex(twitter, "\u2019|`","'")
twitter <- stri_replace_all_regex(twitter, "\u201c|\u201d|u201f|``",'"')

# save the data to an .RData files
save(blogs, file="blogs.RData")
save(news, file="news.RData")
save(twitter, file="twitter.RData")

# perform some exploratory analysis

# file size (in MegaBytes/MB)
file.info("Coursera-SwiftKey/final/en_US/en_US.blogs.txt")$size   / 1024^2
file.info("Coursera-SwiftKey/final/en_US/en_US.news.txt")$size    / 1024^2
file.info("Coursera-SwiftKey/final/en_US/en_US.twitter.txt")$size / 1024^2

# library for plotting
library(ggplot2)

stri_stats_general( blogs )
stri_stats_general( news )
stri_stats_general( twitter )

# Find the word counts per line, plus basic statistics of distribution for all 3 corplus.
words_blogs   <- stri_count_words(blogs)
summary( words_blogs )
sum(words_blogs)
qplot(words_blogs)

words_news    <- stri_count_words(news)
summary(words_news )
sum(words_news)
qplot(words_news)

words_twitter <- stri_count_words(twitter)
summary(words_twitter)
sum(words_twitter)
qplot(words_twitter)


# create a smaller sample of the data 

# load data
load("blogs.RData")
load("news.RData")
load("twitter.RData")

# sample data (~900k blogs, 1010k news, 2360k twitters) 
# base on the computation resource use in training, I sample 10k for each news/blogs,
# and double that on twitters, as for phone texting twitter seems to mimic the behavior better
# so I give it a heavior weight in sampling
sample_blogs   <- sample(blogs, 1000)
sample_news    <- sample(news, 1000)
sample_twitter <- sample(twitter, 2000)

# save samples
save(sample_blogs, sample_news, sample_twitter, file= "sample_data.RData")

