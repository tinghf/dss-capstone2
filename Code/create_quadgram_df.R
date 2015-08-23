n <- 4L 
quadgram_token <- function(x) NGramTokenizer(x, Weka_control(min = n, max = n))

# quadgram Term-Document Matrix
tdm_quadgram <-
  vc_all %>%
  TermDocumentMatrix( control = list( removePunctuation = TRUE,
                                      removeNumbers = TRUE,
                                      wordLengths = c( 1, Inf),
                                      tokenize = quadgram_token)
                      )

# aggregate frequencies
tdm_quadgram %>%
  as.matrix %>%
  rowSums -> freq_quadgram

# repeat by frequency
freq_quadgram %<>%
  names %>%
  rep( times = freq_quadgram )

# split the quadgram into three columns
freq_quadgram %<>%
  strsplit(split=" ")

# filter out those of less than three columns
freq_quadgram <- do.call(rbind, 
                        Filter( length_is(4),
                                freq_quadgram )
                        )

# transform to data.frame encode as factors
df_quadgram <- data.frame(X1 = factor(freq_quadgram[,1], levels = unigram_levels),
                         X2 = factor(freq_quadgram[,2], levels = unigram_levels),
						 X3 = factor(freq_quadgram[,3], levels = unigram_levels),
                         Y  = factor(freq_quadgram[,4], levels = unigram_levels) )

# save data frame
save( df_quadgram, unigram_levels, file = "df_quadgram.RData")

