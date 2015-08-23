require(shiny)
require(markdown)

shinyUI(
    navbarPage("Coursera Data Science Capstone", inverse = FALSE, collapsible = FALSE, 
               tabPanel("Prediction", 
                        fluidRow(
                            sidebarPanel(width=3,
                                         hr(),
                                         helpText(h5("Help Instruction:")),
                                         helpText("To predict the next word in the sentence:"),
                                         helpText("1. Type your sentence in the input text field"),
                                         helpText("2. The value will be passed to the model while you are typing."),
                                         helpText("3. Obtain the predictions below."),
                                         helpText("
                                                  After the app is 100% loaded you will see the prediction
                                                  for the default sentence example \"Thanks for stopping by\"
                                                  on the right side."),
                                         hr(),
                                         h5("Text Input:"),
                                         textInput("entry", 
                                                   "Input a phrase below and press enter to predict the next word (be patience for initial loading):",
                                                   "input a phrase here"),
                                         br(),
                                         helpText(h5("Note:")),
                                         hr(),
                                         h6("This App is built for:"),
                                         a("Coursera Data Science Capstone", href="https://www.coursera.org/course/dsscapstone"),
                                         p("class started on 9 July 2015"),
                                         hr(),
                                         br()
                                         ),
                            mainPanel(
                                column(5,
                                       h3("Word Prediction"),hr(),
                                       h5('The sentence you just typed:'),                             
                                       wellPanel(span(h4(textOutput('sent')),style = "color:#428ee8")),
                                       hr(),
                                       h5('Next Word Prediction:'),
                                       wellPanel(span(h4(textOutput('top1')),style = "color:#e86042")),
                                       hr(),
                                       p()
                                ),
                                column(5,
                                       h3(" "),
                                       br()
                                 )
                                )
                            )
               ),
               tabPanel("Model/Algorithm",
                        sidebarLayout(
                            sidebarPanel(width=3,
                                         helpText(h5("Help Instruction:")),
                                         helpText("Please switch the panels on the right side to figure out:"),
                                         helpText("- Description on data processing pipeline of the predictive model"),
                                         helpText("- How does the application work"),
                                         hr(),
                                         h6("This Application is built for:"),
                                         a("Coursera Data Science Capstone", href="https://www.coursera.org/course/dsscapstone"),
                                         p("class started on 6th July 2015"),
                                         hr(),
                                         br()
                                         ),
                            mainPanel(
                                tabsetPanel(type="tabs",
                                            tabPanel("Model Description",                                                      
                                                     h3("Predictive Model Pipeline"),hr(),
                                                     h4("Clean the training dataset"),
                                                     p("The raw Swiftkey text datasets are about 580M in total- en_US.blogs.txt-210M,
                                                       en_US.news.txt-206M, and en_US.twitter.txt-167M"),
                                                     p("The raw dataset was imported through R readLines() function.  The large dataset 
                                                       was sampled into smaller dataset to reduce processing time and avoid out of 
                                                       memory problem in later stages. 
                                                       The sampled data was then tokenized with n-grams extracted, using the 
                                                       N-grams tokenizer in the RWeka packages.
                                                       Also following data cleaning was performed: 
                                                       - remove white-spaces
                                                       - change all words to lower case
                                                       - remove punctuation
                                                       - remove numbers
                                                       - profanity filtering                                                       
                                                       "),
                                                     p("After the above processing, the three corpus are then combined and we end up 
                                                       with a 1-3 n-gram frequency matrix. "),
                                                     hr(),
                                                     h4("Build the model"),
                                                     p(a("Naive Bayes", href = "http://www.inside-r.org/packages/cran/e1071/docs/naiveBayes"),
                                                       'and was used for estimating the probabilities corresponding to the observed frequencies, 
                                                       and the joint probability of all unobserved species. The last three words of users\' input sentence will be extracted first and used to predict the next words. ' ),                                                         
                                                     hr(),
                                                     br()
                                                     ),
                                            
                                            tabPanel("Application Work-flow",                                                       
                                                     h3("Shiny App Prediction Algorithm"),
                                                     hr(),
                                                     h4("Pre-process"),
                                                     p("1. Obtain the data from the input box."),
                                                     p("2. Cleaning for the data sentence. Numbers, punctuations,
                                                       extra spaces will be removed, and all words are converted to lower-case."),
                                                     hr(),
                                                     h4("Tokenize"),
                                                     p("After preprocessing, the sentence will be truncated from the last 3 words.
                                                       , If there are less than 3 words, all the words will be used."),
                                                     hr(),
                                                     h4("Search pattern"),
                                                     p("Search the pattern from the n-gram model 
                                                       The algorithm will search the pattern from the frequency matrix, 
                                                       and then return the it's next word prediction. ")
                                                     )
                                            )
                                        )
                                    )
                        )
               )
    )
