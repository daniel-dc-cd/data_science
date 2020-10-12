# Map functions in purrr
# https://r4ds.had.co.nz/iteration.html#the-map-functions
# https://purrr.tidyverse.org/reference/map.html
# https://jennybc.github.io/purrr-tutorial/index.html
# https://data.library.virginia.edu/getting-started-with-the-purrr-package-in-r/

library(tidyverse)
(.packages())

my_list <- list(
  c(1,2,3),
  c(4,5,6),
  c(8,2,9)
)

# find avg of each vector

my_list[[1]] %>% mean()
my_list[[2]] %>% mean()
my_list[[3]] %>% mean()

mean(my_list[[1]])

# basic usage of map
my_list 

my_list %>% map(mean)
map(my_list, mean)

#specific map
my_list %>% map_dbl(mean)

#anonymous
my_list %>% map(~ . * 2)

#other maps
my_list %>% map_lgl(is.numeric)
my_list %>% map_chr(is.numeric)
