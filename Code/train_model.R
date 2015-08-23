
# load the libraries
library(e1071)

# load the trigram data
load("df_trigram.RData")

# e1071 package
tri_naiveBayes <- 
  naiveBayes( Y ~ X1 + X2  ,
              df_trigram )

# save the model
save(tri_naiveBayes, unigram_levels, file = "tri_naiveBayes.RData")


# load the trigram data
load("df_quadgram.RData")

# e1071 package
quad_naiveBayes <- 
  naiveBayes( Y ~ X1 + X2 + X3 ,
              df_quadgram )

# save the model
save(quad_naiveBayes, unigram_levels, file = "quad_naiveBayes.RData")

