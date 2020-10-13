#We have two random variables, X and Y, with their respective sample spaces:
#  Ωx={0,5,10}
#  Ωy={0,5,10,15}

# The joint probability table for these random variables is given by:

#        P(Y=0) P(Y=5) P(Y=10) P(Y=15)
#P(X=0)  0.02   0.06 	0.02 	  0.10
#P(X=5)  0.04 	 0.15 	0.20 	  0.10
#P(X=10) 0.01 	 0.15 	0.14 	  0.01
  
# In R, we can generate this matrix, which we call p, by writing:
p <- matrix(c(.02,.04,.01,.06,.15,.15,.02,.20,.14,.10,.10,.01),ncol=4) 

p

#A few things to note here : We assigned the values to a variable called p.
#The assignment operator is “<-”. This means that if I want to create an object (like a vector or a matrix) that I want to store in the “global environment” (top right hand side), I will write: “name of object” <- “write what the object is”. So if I wanted to store the variable xx=2+5 I would write “xx <- 2+5”.
#The values in p do not automatically display. We can display p by typing its name in the console.

#Let's dig into matrix() and c(), what is it that they do?

test1 <- c(1,2,3,4)
test1

test2 <- matrix(c(1,2,3,4), ncol=1)
test2

test3 <- matrix(c(1,2,3,4), ncol=2) 
test3

test4 <- matrix(c(1,2,3,4,5,6), ncol=2)
test4

test5 <- matrix(c(1,2,3,4,5,6), ncol=3)
test5

matrix1 <- matrix(c(1,2,3,4,5,6,7,8), ncol=2)
matrix1

matrix2 <- matrix(c(1,2,3,4,5,6,7,8,9), ncol=3)
matrix2

p[2,3]

sum(p)

p[1,2]

### Computing Marginal Probabilities
# Remember that, for example, the marginal probability of X=0 is given by:
#  P(X=0)=P(X=0∧Y=0)+P(X=0∧Y=5)+P(X=0∧Y=10)+P(X=0∧Y=15)
# This is the sum of all the elements in the first row of matrix p, right? Then P(X=5) is given by the sum of all elements in the second row of matrix p, and P(X=10) is given by the sum of all elements in the last row of matrix p. You can compute all three marginal probabilities with the following line:

px <- apply(p,1,sum)
px

# The apply function says: Take matrix p, and, row by row (“1” means “by row”), compute the sum of the elements in the row. This function is very powerful since it computes the sums for all rows at once.

# To compute the marginal probabilities for Y, we would have to sum over the columns. To do this, we will use again the apply function but we change 1
# to 2, because 2 means “column-by-column”. The code below says: Take matrix p, and column by column, compute the sum of the elements in each column.

py <- apply(p,2,sum)
py

# Check your understanding
# Exercise: Display P(Y=0) and P(Y=15). 
# Check these numbers by hand. Are the numbers you computed by hand the same as those in the vector py computed with the code above?
  
### Computing conditional probabilities

# To compute conditional probabilities, we apply the formula that links conditional probabilities to joint and marginal probabilities. 
# For example, to compute:
# P(X=5|Y=5) = 0.150/0.36 = 0.4166667

# we would have to take the element p[2,2] and divide it by py[2]. The code for this is:

p_x5_y5 <- p[2,2]/py[2]  ## computes conditional probability P(X=5|Y=5)
p_x5_y5   

 
# Compute P(X=0|Y=5) and P(X=10|Y=5). Call the first conditional probability p_x0_y5 and the second one p_x10_y5.
# We now store the conditional probability P(X|Y=5) as a row vector with 3 elements and call this object p_x_y5:
p_x0_y5 <- p[1,2]/py[2]  ## computes conditional probability P(X=0|Y=5)
p_x0_y5 

p_x10_y5 <- p[3,2]/py[2]  ## computes conditional probability P(X=10|Y=5)
p_x10_y5


p_x_y5 <- c(p_x0_y5,p_x5_y5,p_x10_y5)
p_x_y5


# Decision Tree Demo with Titantic Data
# Packages needed
library(tidyverse)

library(readr)
library(dplyr)
library(party)
library(rpart)
library(rpart.plot)
library(ROCR)
set.seed(100)

titanic3 <- "https://goo.gl/At238b" %>%
  read_csv %>% # read in the data
  select(survived, embarked, sex, 
         sibsp, parch, fare) %>%
  mutate(embarked = factor(embarked),
         sex = factor(sex))
titanic3
View(titanic3)

.data <- c("training", "test") %>%
  sample(nrow(titanic3), replace = T) %>%
  split(titanic3, .)
rtree_fit <- rpart(survived ~ ., 
                   .data$training) 
rpart.plot(rtree_fit)

tree_fit <- ctree(survived ~ ., 
                  data = .data$training)
plot(tree_fit)

tree_roc <- tree_fit %>%
  predict(newdata = .data$test) %>%
  prediction(.data$test$survived) %>%
  performance("tpr", "fpr")

plot(tree_roc)
