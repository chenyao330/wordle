shinyUI(fluidPage(
    
    useShinyjs(),

    textInput("myword", NULL),
    
    actionButton("check", label = "check"),
    
    verbatimTextOutput("results", placeholder = TRUE)
    
   
    
))
