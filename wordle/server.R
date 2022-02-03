shinyServer(function(input, output, session) {
    
    shinyjs::runjs("$('#myword').attr('maxlength', 5)")
    
    tries <- reactiveValues(
        results = list()
    )
    
    observeEvent(input$check,{
        word_input <- input$myword
        result <- check_word(real = word_today, guess = word_input)
        tries$results <- c(tries$results, list(result))
        
        if (length(tries$results) == 5){
            disable(id = "myword")
        }
        
        
    })
    
    output$try_results <- renderPrint({
        tries$results
    }) 
    
    

})
