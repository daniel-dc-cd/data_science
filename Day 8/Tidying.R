library(tidyverse)

# Which of these is tidy data

table1

table2

table3

table4a

table4b


# Tidying when a column names are values of variables

table4a

tidy4a <- table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")

tidy4b <- table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")

left_join(tidy4a, tidy4b)

# Tidying when observations are accross multiple rows

table2

table2 %>%
  pivot_wider(names_from = type, values_from = count)

# Tydiyng when multiple variables in the same row 

table3

table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/")
