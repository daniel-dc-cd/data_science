
#Setup for demo
(.packages())
library(tidyverse)

#loading up the dataset
library(palmerpenguins)
data(package = "palmerpenguins")
?penguins

#exploring the dataset
glimpse(penguins)
?glimpse

#Make a single blox plot
ggplot(penguins, aes(y=body_mass_g, factor = 1)) +
  geom_boxplot()

ggplot(penguins, aes(y=body_mass_g)) +
  geom_boxplot()

#coor_flip demo - vertical bar
ggplot(penguins, aes(x = species)) +
  geom_bar()
  coord_flip()
  
#coor_flip demo - horizontal bar
ggplot(penguins, aes(y = species)) +
    geom_bar()

#https://www.tidyverse.org/blog/2020/03/ggplot2-3-3-0/#bi-directional-geoms-and-stats

penguins%>%
  count(species) %>%
  mutate(prop = n/sum(n))
  
penguins%>%
  count(species) %>%
  mutate(prop = n/sum(n)) %>%
  #feed result to ggplot() to be displayed using geom_col()
  ggplot(aes(x = prop, y = species)) +
  geom_col()
  
penguins %>%
  count(species) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(aes(x = prop, y = fct_reorder(species, prop))) +
  geom_col()

#https://forcats.tidyverse.org/reference/index.html

library(scales)
penguins %>%
  count(species) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(aes(x = prop, y = fct_reorder(species, prop))) +
  geom_col() +
  scale_x_continuous(labels = label_percent(accuracy = 1)) +
  labs(
    x = "percentage",
    y = "species",
    title = "Species Distribution of Penguins on the LTER",
    subtitle = "Saudi Digital Academy 2020",
    caption = "Antartica Palmer Station Study"
  )

#https://scales.r-lib.org/reference/index.html
#https://gganimate.com/
#https://wilkelab.org/ggridges/



  