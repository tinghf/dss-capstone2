### Exploration Anaylsis for the Capstone Dataset

### Background

In this capstone project we attempt to build a predictive test models like those used by SwiftKey. This report contains the exploratory analsys of the dataset provided by coursera.

The data set contains 3 files in different languages (each resided in it’s own directory), the following is the data files for US English: - en_US.blogs : collections of blogs, one line for each blog entries; - en_US.news : collections of internet news stories, one line for each news paragraphs; - en_US.twitter : collections of tweets from twitters;

### Source files 

| Name                 | Description                                                           |
| -------------------- | --------------------------------------------------------------------- |
| import_data.R        | download and import data, generate .rdata for later stages;           |
| explore_data.R       | perform some exploratory analysis on dataset;                         |
| create_ngram_df.R    | use RWeka pacakge to create n-gram data frame for further processing; |
| train_model.R        | use naive Bayes classifier from e1071 to train model;                 | 
| predict_from_model.R | sample tests to predict from model built from above;                  | 

