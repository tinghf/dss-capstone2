FinalPresentation
========================================================
author: Tony Ting
date: 14th Aug 2015

Data Science Specialization - Capstone Project

Build and evaluate a NLP predictive text model 


Objective
========================================================

The goal of this Capstone Project is to produce a predictive test algorithm in R, that based on certain text that user input the system will predict the next most likely word to be entered, the application can be applied to mobile device to do predictive text input to save user's time to typing. 


Model description
========================================================

- A simple <a href="https://en.wikipedia.org/wiki/N-gram">n-gram model</a> was contructed for predicting the next word based on the previous 1, 2, or 3 words.
- <a href="https://en.wikipedia.org/wiki/Katz's_back-off_model">Katz back-off</a> is a generative n-gram language model that estimates the conditional probability of a word given its history in the n-gram. 
- The model was built and tuned to optimized for the size and runtime, a relatively smaller memory footprint was required to run the data and a Shiny app was created to demonstrate the execution of the model. 


Data Processing Pipeline
========================================================

- Sample dataset provided by <a href="https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip">SwiftKey</a> was downloaded and loaded through ReadLines();
- Random sampling performed on dataset to reduce set of training data and provide test data set; 
- Sampled data is then cleaned(remove spaces/punctuactions/numbers/profanity words); 
- Cleaned data is then feed into n-gram tokenizer to create the relevant n-gram TermDocumentMatrix;
- N-gram data is then feed through a <a href=""https://en.wikipedia.org/wiki/Naive_Bayes_classifier">Naive Bayes</a> model; 
- A Shiny app was created to make use of the model data above to perform prediction on user input text; 


Shiny Applications
========================================================

- Application could be found here
- type your desired text phrase into the text input box;
- the Shiny app will return the predicted next word given t he phrase entered; 


