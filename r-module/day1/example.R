
die <- 1:6
mean(die)
round(mean(die))
## sample() takes two arguments, a vector named x and a number named size.sample
# sample() returns size elements from the vector. Type ?sample for more info
sample(x=1:4., size = 2)
## Run it multiple times! Now set x, the vector, to die and roll the dice!
sample(x=die, size = 1)

## Note: Every argument in R has a name, x a name, representing the vector and size represents
# sample size that the function returns
# names are optional though so you can also do the above code like this:
sample(die,2)

## What happens if you use an argument that doesn't exist? make sure you check 
# if you're not sure. TRY THIS CODE: sample(die, corner=1)
# how do you check? Well use the args() function. Give it a shot!
args(sample)
args(round)
## when you run args round, you see that digits has been pre-defined
round(3.234239988, 2) 

## Pro-tip: Arguments in R always stay the same, so you can 
sample(size = 1, x = die)

## What about running something that makes 2 dice? 
sample(die, size = 2)

## Notice something? The numbers are never the same. So you can't roll a 1 1 
sample(die, 2)
sample(die, 2)
sample(die, 2)
sample(die, 2)
sample(die, 2)
sample(die, 2)
sample(die, 2)
sample(die, 2)
sample(die, 2)

## This is because by default, sample makes a sample without a replacement.
# Think of it like a lottery with six balls. You pull out two.
# Get it?
sample(die,2,replace = TRUE)

## To bring it all together
# We can 
die <- 1:6
dice <- sample(die,2,replace = TRUE)
sum(dice)

## So now let's talk about creating a function called roll, that we can 
# do that thing we just did.
# Functions in R have 3 parts, a name, a body of code, and arguments
# my_new_function <- function () {}

roll <- function () {
  die <- 1:6
  dice <- sample(x = die, size = 2,replace = TRUE)
  sum(dice)
}

## We can type each line of code in a function and when we use the braces {}
# R will wait until you add the closing brace, try it!

## Now let's execute the function if you haven't already
roll()

# Think of the parenthesis as a trigger to run the function
# Try running roll() without
roll

## Let's do some more work with arguments, we can remove a line of code and replace
#it with something else.

roll2 <- function(bones) {
  dice <- sample(bones, size=2, replace = TRUE)
  sum(dice)
}

# Try running it! What happened? It's because we need the bones argument
roll2(bones <- 1:6)

# we can also set a default for the argument in the function
roll2 <- function(bones = 1:6) {
  dice <- sample(bones, size=2, replace = TRUE)
  sum(dice)
}


## I'm going to suggest that you write all of your code in a Script
# It's easy and then you will have a habit that creates a reproducible record 
# of your work. When you're finished for the day, you can simply upload your code
# to github and go

# You can also run a line of code in a script by putting your cursor on the 
# line you want to run and then click the "Run" button in the upper right side
# of the script pane.

# It's also hard to write a multi-line piece of code in the console. You'll 
# be writing scripts soon! I promise.

# Let's Review
# R is a scripting language that we don't compile.
# we write commands in the command line and run them or we can do it in a script
# R uses the regular math operators and some new ones like 
# inner and outer multiplication, and the <- left arrow
# we can also create objects which are a lot like variables in other langs


