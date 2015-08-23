# load the libraries
library(e1071)
library(stringr)

# load the model
load("tri_naiveBayes.RData")

# create a test string
# test_string <- "accused of"
test_string <- "good morning"

# split it into separate words
test_split <- strsplit(test_string, split = " " )

# encode as a factor using the same levels
test_factor <- factor(unlist(test_split), levels=unigram_levels)

# transform to data frame
test_df <- data.frame(X1 = test_factor[1], X2 = test_factor[2])

# estimate using the model
predict(tri_naiveBayes, test_df)

predict_word <- function(phrase) 
{
  last_2_words <- paste(word(phrase, -2:-1), collapse=" ")
  split_words <- strsplit(last_2_words, split = " " )
  factors <- factor(unlist(split_words), levels=unigram_levels)
  df <- data.frame(X1 = factors[1], X2 = factors[2])
  predict(tri_naiveBayes, df)
}



