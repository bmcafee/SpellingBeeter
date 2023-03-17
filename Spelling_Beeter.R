library(words)
list_of_words <- words::words
word_vector <- list_of_words$word

i <- 0
while (i == 0){
  reference <- readline("What are the 7 characters for this game?: ")
  if(nchar(reference) == 7){
    i <- 1
  }
}


i <- 0
while (i == 0){
  vital_letter <- readline("Which is the center letter for this game?: ")
  if(nchar(vital_letter) == 1){
    i <- 1
  }
}

contains_only <- function(str, char_set) { # ChatGPT wrote this function and it actually worked
  # Convert the string and character set to lowercase
  str <- tolower(str)
  char_set <- tolower(char_set)
  
  # Check if every character in the string is also in the character set
  all(unlist(strsplit(str, "")) %in% unlist(strsplit(char_set, "")))
}

word_vector <- word_vector[nchar(word_vector) >= 4 & grepl(vital_letter, word_vector)]

word_ref <- c()
for (i in 1:length(word_vector)){
  word_ref[i] <- contains_only(word_vector[i], reference)
}

print("Possible answers (not all will be worth points in Spelling Bee):")
print(sort(word_vector[word_ref]))
