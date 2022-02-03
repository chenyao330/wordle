library(shiny)
library(shinyjs)

word_list <- read.csv("word_list.csv")

set.seed(Sys.Date())
word_today <- sample(word_list$word, 1)

check_word <- function(real, guess){
  
  real_letters <- strsplit(real, split="")[[1]]
  guess_letters <- strsplit(guess, split="")[[1]]
  
  stats <- c()
  for (i in seq_along(guess_letters)){
    if (guess_letters[i] == real_letters[i]){
      stat <- "correct"
    } else if(is.element(guess_letters[i], real_letters)){
      stat <- "exist"
    } else{
      stat <- "wrong"
    }
    stats <- append(stats, stat)
  }
  results <- list(
    letters = guess_letters,
    results = stats
  )
  
  return(results)
}

