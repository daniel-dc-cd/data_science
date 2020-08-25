# Loading the Library
library("tidyverse")

# Taking a look at the data set
mpg
df <- mpg
?mpg

# My first plot with ggplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# Adding a color classifier to understand how different cars are affected
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# Adding facets to the graph for better exploration
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# Adding trendlines
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# Adding a classifier to smooth lines
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

# Lines on top of points
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv))

# Adding Filters
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

# Bar Plots
bar <- ggplot(data = mpg) + 
  geom_bar(mapping = aes(x =class, fill = class)) + 
  labs( title = "types of cars", x = "classification of car", y = "number of cars")

bar + coord_polar()
