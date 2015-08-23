require(shiny)

load("tri_naiveBayes.RData")
source('predict_from_model.R')

shinyServer(function(input, output) {
    dataInput <- reactive(predict_word(input$entry))
    
    output$top1 <- renderText({
        paste("Predicted phrase:", input$entry, dataInput()[1])
    })
    
    output$text <- renderText({
        dataInput()
    })
    output$sent <- renderText({
        input$entry
    })
    
    output$modelTable = renderDataTable({
        Quatrgrams_models
    }, options = list(lengthMenu = c(5, 10, 20), pageLength = 5))
    
    withProgress(message = 'Loading Data ...', value = NULL, {
        Sys.sleep(0.01)
        dat <- data.frame(x = numeric(0), y = numeric(0))
        withProgress(message = 'Initializing', detail = "part 0", value = 0, {
            for (i in 1:10) {
                dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
                incProgress(0.1, detail = paste(":", i*10,"%"))
                Sys.sleep(0.01)
            }
        })
        
        # Increment the top-level progress indicator
        incProgress(0.5)
    })
})
