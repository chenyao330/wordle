shinyUI(fluidPage(
    
    useShinyjs(),

    textInput("myword", NULL),
    
    actionButton("check", label = "check"),
    
    verbatimTextOutput("try_results", placeholder = TRUE)
    
   
    
))
