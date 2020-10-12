#map functions in the purrr package pt. 2

#Check out vroom - it's fast!
#https://vroom.r-lib.org/

#Arithmetic Operators
#https://www.tutorialspoint.com/r/r_operators.htm

library(tidyverse)

library(palmerpenguins)
data(package = "palmerpenguins")

?penguins

# check your working directory
getwd()
# setwd("/Users/danieloostra/data_sci_bootcamp/data_science/r-module/tidyverse")

penguins %>%
  group_by(species) %>%
  group_walk(~ write_csv(.x,paste0("data/",.y$species,".csv")))

library(fs)
dir_ls(path = "data", glob="*csv")

adelie <- read_csv("data/Adelie.csv")
chinstrap<- read_csv("data/Chinstrap.csv")
gentoo <- read_csv("data/Gentoo.csv")
all_three <- bind_rows(adelie, chinstrap, gentoo, .id = "species")

list_of_files <- dir_ls(path = "data", glob="*csv")
list_of_files

map_dfr(list_of_files, read_csv, .id = "species")

library(vroom)
vroom(list_of_files, id="species")
?vroom

vroom(list_of_files, id="species") %>%
  mutate(
    species = str_remove(species, "data/"),
    species = str_remove(species, "\\.csv")
  )

# Workig with list columns

# From last exercise
penguins_madeup_list <- tribble(
  ~name,        ~sex,     ~body_mass, 
  "Mumble",     "male",   c(4801, 5699, 5743),         
  "Gloria",     "female", c(4785, 3092, 4220),         
  "Memphis",    "male",   c(3349, 4186, 4454),         
  "Norma Jean", "female", c(4235, 3220, 4019)        
)


penguins_madeup_list %>%
  mutate(body_mass_avg = purrr::map_dbl(body_mass, mean))

penguins_madeup_list %>%
  rowwise() %>%
  mutate(body_mass_avg = mean(body_mass))

penguins_madeup_list <- penguins_madeup_list %>%
  rowwise() %>%
  mutate(body_mass_summary = list(summary(body_mass)))

penguins_madeup_list

penguins_madeup_list %>%
  unnest_wider(body_mass_summary)

#Data Rectangling

install.packages("palmerpenguins")
