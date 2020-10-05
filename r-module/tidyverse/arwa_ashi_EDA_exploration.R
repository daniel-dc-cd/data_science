#-------------------------------------
# Exploratory Data Analysis EDA October 5, 2020
#-------------------------------------
# Think of EDA as a research and development process where you open your mind to what is possible to find in this space.
# There are generally two types of question to ask about the data:
# 1- How much do things change? why?
# 2- What variables affect that change?

library(tidyverse)

# discrete Variable
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=cut))

# countinous Variables
?geom_histogram
ggplot(data = diamonds)+
  geom_histogram(mapping = aes(x = carat),binwidth=0.5)

#changing Bin Size
(smaller<- diamonds %>%
    filter(carat<3))

ggplot(data = smaller, mapping = aes(x=carat))+
  geom_histogram(binwidth = 0.1)

# Overlaying different histogram
ggplot(data=smaller, mapping = aes(x=carat, color=cut))+
  geom_freqpoly(binwidth=0.1)

# Question after seeing a graph
ggplot(data=smaller, mapping=aes(x=carat))+
  geom_histogram(binwidth = 0.01)

# why there is more diamond to the right of the peek than the left?
# seem like the distribution is going down then significan there is a peek then slowling going down?
# is it because it is easy to cut that size or 
# what is exactly making this?

#-------------------------------------
# the other type of question is how thing change and why?
# Covariation
#-------------------------------------
# Countinous Variables
# count not very helpful since each cut has different count
ggplot(data=diamonds, mapping = aes(x=price))+
  geom_freqpoly(mapping=aes(color=cut),binwidth=500)

# Adding density instead of count
View(diamonds)
??..density..
ggplot(data = diamonds, mapping = aes(x=price, y=..density..))+
  geom_freqpoly(mapping = aes(color=cut),binwidth=500)

# Box Plots
# notice that mean premium cut price is higher than mean ideal cut price? why?
ggplot(data=diamonds, mapping = aes(x=cut,y=price))+
  geom_boxplot()

# Categorical Values 
ggplot(data=diamonds)+
  geom_count(mapping = aes(x=cut,y=color))

diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x=color, y=cut))+
  geom_tile(mapping = aes(fill=n))

# Continous Variables
ggplot(data=diamonds)+
  geom_point(mapping = aes(x=carat,y=price))

#Tile 2D
ggplot(data=smaller)+
  geom_bin2d(mapping = aes(x=carat,y=price))

# add boxplot to it to understand it
ggplot(data=smaller,mapping = aes(x=carat,y=price))+
  geom_boxplot(mapping = aes(group = cut_width(carat,0.1)))




