library(words)

word_list <- filter(words, word_length == 5)

write_csv(word_list, file = "word_list.csv")
