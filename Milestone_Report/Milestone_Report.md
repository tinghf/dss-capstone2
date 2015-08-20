Background
==========

In this capstone project we attempt to build a predictive test models
like those used by SwiftKey. This report contains the exploratory
analsys of the dataset provided by coursera.

The data set contains 3 files in different languages (each resided in
it's own directory), the following is the data files for US English: -
en\_US.blogs : collections of blogs, one line for each blog entries; -
en\_US.news : collections of internet news stories, one line for each
news paragraphs; - en\_US.twitter : collections of tweets from twitters;

We analyse three corpora of US English text found online. We find that
the **blogs** and **news** corpora are similar, the **twitter** corpus
is different. We propose that this is the result of the 140 character
limit of Twitter messages.

Data Download
=============

The dataset is provided by coursera in a zip file format

    # download and extract dataset
    download.file("https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip", "Coursera-SwiftKey.zip")
    unzip("Coursera-SwiftKey.zip")

    # list the extracted data file 
    list.files("Coursera-SwiftKey/final", recursive=TRUE)

    ##  [1] "de_DE/de_DE.blogs.txt"   "de_DE/de_DE.news.txt"   
    ##  [3] "de_DE/de_DE.twitter.txt" "en_US/en_US.blogs.txt"  
    ##  [5] "en_US/en_US.news.txt"    "en_US/en_US.twitter.txt"
    ##  [7] "fi_FI/fi_FI.blogs.txt"   "fi_FI/fi_FI.news.txt"   
    ##  [9] "fi_FI/fi_FI.twitter.txt" "ru_RU/ru_RU.blogs.txt"  
    ## [11] "ru_RU/ru_RU.news.txt"    "ru_RU/ru_RU.twitter.txt"

Import the corpus through readLines

    blogs <- readLines("Coursera-SwiftKey/final/en_US/en_US.blogs.txt", encoding="UTF-8")
    twitter <- readLines("Coursera-SwiftKey/final/en_US/en_US.twitter.txt", encoding="UTF-8")

    ## Warning in readLines("Coursera-SwiftKey/final/en_US/en_US.twitter.txt", :
    ## line 167155 appears to contain an embedded nul

    ## Warning in readLines("Coursera-SwiftKey/final/en_US/en_US.twitter.txt", :
    ## line 268547 appears to contain an embedded nul

    ## Warning in readLines("Coursera-SwiftKey/final/en_US/en_US.twitter.txt", :
    ## line 1274086 appears to contain an embedded nul

    ## Warning in readLines("Coursera-SwiftKey/final/en_US/en_US.twitter.txt", :
    ## line 1759032 appears to contain an embedded nul

    # need to read news in binary format, or we will hit error
    con <- file("Coursera-SwiftKey/final/en_US/en_US.news.txt", open="rb")
    news <- readLines(con, encoding="UTF-8")
    close(con)
    rm(con)

Summary Statistics
==================

    # file size (in MegaBytes/MB)
    file.info("Coursera-SwiftKey/final/en_US/en_US.blogs.txt")$size   / 1024^2

    ## [1] 200.4242

    file.info("Coursera-SwiftKey/final/en_US/en_US.news.txt")$size    / 1024^2

    ## [1] 196.2775

    file.info("Coursera-SwiftKey/final/en_US/en_US.twitter.txt")$size / 1024^2

    ## [1] 159.3641

Require libraries for analysis

    # library for character string analysis
    library(stringi)
    # library for plotting
    library(ggplot2)

General statistics for the character vectors

    stri_stats_general( blogs )

    ##       Lines LinesNEmpty       Chars CharsNWhite 
    ##      899288      899288   206824382   170389539

    stri_stats_general( news )

    ##       Lines LinesNEmpty       Chars CharsNWhite 
    ##     1010242     1010242   203223154   169860866

    stri_stats_general( twitter )

    ##       Lines LinesNEmpty       Chars CharsNWhite 
    ##     2360148     2360148   162096031   134082634

Find the word counts per line, plus basic statistics of distribution for
all 3 corplus.

    words_blogs   <- stri_count_words(blogs)
    summary( words_blogs )

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    0.00    9.00   28.00   41.75   60.00 6726.00

    sum(words_blogs)

    ## [1] 37546246

    qplot(   words_blogs )

    ## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.

![](Milestone_Report_files/figure-markdown_strict/unnamed-chunk-7-1.png)

    words_news    <- stri_count_words(news)
    summary( words_news )

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00   19.00   32.00   34.41   46.00 1796.00

    sum(words_news)

    ## [1] 34762395

    qplot(   words_news )

    ## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.

![](Milestone_Report_files/figure-markdown_strict/unnamed-chunk-7-2.png)

    words_twitter <- stri_count_words(twitter)
    summary( words_twitter )

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1.00    7.00   12.00   12.75   18.00   47.00

    sum(words_twitter)

    ## [1] 30093369

    qplot(   words_twitter )

    ## stat_bin: binwidth defaulted to range/30. Use 'binwidth = x' to adjust this.

![](Milestone_Report_files/figure-markdown_strict/unnamed-chunk-7-3.png)

Summary
=======

-   Size of corplus is around 200MB for blogs, 196MB for news, 159MB for
    twitter;
-   lines of corplus is around 899K for blogs, 77K for news, 2360K for
    twitter;
-   for approximately the same size of corplus, twitter contains a lot
    more lines, this is due to the relatively shorter line lengths
    (since each tweet is limieted to 140 characters);
-   frequency distribution of words looks similar for blogs and news,
    while twitter looks quite different, probably due to the same
    reason;
