shinyServer(function(input, output, session) {
    
    shinyjs::runjs("$('#myword').attr('maxlength', 5)")
    
    tries <- reactiveValues(
        results = list()
    )
    
    observeEvent(input$check,{
        word_input <- input$myword
        result <- check_word(real = word_today, guess = word_input)
        tries$results <- c(tries$results, list(result))
        
        if (any(result$results == "correct")){
            disable(id = "myword")
            showModal(modalDialog(
                title = "Congratulations!",
                paste0("Today's word is '", word_today, "'."),
                easyClose = TRUE,
                footer = NULL
            ))
        } 
        
        
        if (length(tries$results) == 5){
            disable(id = "myword")
            showModal(modalDialog(
                title = "Oops!",
                paste0("Today's word is '", word_today, "'."),
                easyClose = TRUE,
                footer = NULL
            ))
        }
    })
    
    output$try_results <- renderPrint({
        tries$results
    }) 
    
    

})
