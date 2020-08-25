library(tidyverse)

x <- c ("apple", "banana", "eggplant")
str_view(x,"a..")

stringr::words

# How many common words start with t?
sum(str_detect(words, "^t"))

words[str_detect(words,"^t")]

# What proportion of common words end with a vowel?
mean(str_detect(words, "[aeiou]$"))


# Find all words containing at least one vowel, and negate
no_vowels_1 <- !str_detect(words, "[aeiou]")

words[no_vowels_1]

# Add words to a tibble data frame
df <- tibble(
  word = words, 
  i = seq_along(word)
)

# Use previously known functions

df %>% 
  filter(str_detect(word, "x$"))


df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    consonants = str_count(word, "[^aeiou]"))

# Split strings

sentences

sentences%>%
  head(5) %>%
  str_split(" ", simplify = TRUE)
