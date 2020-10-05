
(.packages())

#install all core packages
library(tidyverse)

#examine our environment
tidyverse_sitrep()
tidyverse_update()

library(palmerpenguins)
?data
data(package = "palmerpenguins")

?penguins
?penguins_raw
head(penguins, 20)
head(penguins_raw, 20)
?library

(y <- 1:4)
mean(y)
reprex()


library(ggplot2)
?geom_point

pen_mass_flip <- ggplot ( data = penguins,
                          aes( x = flipper_length_mm,
                               y = body_mass_g)) +
  geom_point(aes( color = species,
                  shape = species),
             size = 3,
             alpha = 0.8) + 
  theme_minimal() +
  scale_color_manual(values = c("darkorange","purple","red")) +
  labs(title = "The Penguins of Palmer LTER",
       subtitle = "Flipper Length vs Body Mass for all three Penguin types",
       x = "Flipper - mm",
       y = "Body Mass - g",
       color = "penguin spec",
       shape = "penguin spec") +
  theme(legend.position = c(0.2, 0.7),
        legend.background = element_rect(fill = "white", color = NA),
        plot.caption = element_text(hjust = 0, face = "italic"),
        plot.caption.position = "plot")

pen_mass_flip  
