shinyServer(function(input, output) {
    
    shinyjs::runjs("$('#myword').attr('maxlength', 5)")
    
    observeEvent(input$check,{
        word_input <- input$myword
        
        output$results <- renderPrint({
            check_word(real = word_today, 
                       guess = word_input)
        })
    })
    
    

})
