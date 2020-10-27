#Linear Regression
#Using the same seattle weather data as last chapter develop a linear regression model

#import the pakcages that we will need
library(ggplot2)

df <- read.csv('~/data/seattle_weather_1948-2017.csv')

numrows <- 25549 # can be as large as 25549

#create an empty dataframe to hold values
regression_df<-data.frame(matrix(, nrow=numrows, ncol=0))
regression_df$Intercept<-1
regression_df$Today<-0
regression_df$Tomorrow<-0

# Populate regression DF
for(i in seq(1,numrows,1)){
  tomorrow <- df[(i+1),2]
  today <-df[(i),2]
  regression_df[i,3] <- tomorrow
  regression_df[i,2] <- today
  }

regression_df <- regression_df[complete.cases(regression_df),] #exclude any rows with missing data

#this makes a simple dataframe with a relationship that we can now plot
ggplot(regression_df) +
  geom_point(mapping = aes(x = Today, y = Tomorrow))

# Creating a basic linear model to best predict these values. 
# Start with a slope and intercept values of 1 and then iterate through gradient descent.
gradientDescent <- function(X, y, param, alpha, num_iters){
  for (i in 1:num_iters){
    y_hat = as.matrix(X)%*%param
    param = param - alpha*(t(as.matrix(X))%*%(as.matrix(y_hat-y)))
  }
  return(param)
}

# In this fucntion param is the initial guess of the values of the linear function, 
# X is the vector of data values and y is the realization
X <- regression_df[0:200,1:2]
y <- as.data.frame(regression_df[0:200,3])
param <- matrix(c(1,1),nrow = 2)
alpha <- 0.0001
num_iters <- 1000


solution <- gradientDescent(X, y, param, alpha, num_iters)
solution




ggplot(regression_df) +
  geom_point(mapping = aes(x = Today, y = Tomorrow))+
  geom_abline(intercept=solution[1], slope=solution[2])

# However, building models from scratch is hard! Lucky for us there are functions that train models for us!
 
mymodel <- lm(regression_df$Today ~ regression_df$Tomorrow, data = regression_df)
print(mymodel)
regression_df$Predictions<-predict.lm(mymodel)

# Look at the plots of real values in black and predicted values in blue
ggplot(regression_df) +
  geom_point(mapping = aes(x = Today, y = Tomorrow), color="black")+
  geom_point(mapping = aes(x = Today, y = Predictions), color="blue")+
  geom_abline(intercept=solution[1], slope=mymodel$coefficients[2], color = "blue")

# using the r2 (pronounced r squared) value we can get a basic measure of model quality
summary(mymodel)$r.squared

# We can plot the difference between the predictions and the actual values for a visual estimate of performance. 
# A perfect model would result in this being a straight line with a slope of 1. 
# Notice how the model predicts only lower values, meaning that it tends to under predict the actual amount of rain.

ggplot(regression_df) +
  geom_point(mapping = aes(y = Predictions, x = Tomorrow), color="black")+
  scale_y_continuous(limits = c(0,5))+
  scale_x_continuous(limits = c(0,5))

# From this point modify the linear regression method to use two variables.
# Hint. Your x values should have the same number of rows but two columns. You will not be able to plot the line (as it will be 3 dimensional) but you can plot the model predictions agains the actual values.

numrows = 25549 

###################### adjust this code to add columns here #######################################
regression_df<-data.frame(matrix(, nrow=numrows, ncol=0))
regression_df$Today<-0
regression_df$Tomorrow<-0

# Populate regression DF
for(i in seq(1,numrows,1)){
  tomorrow <- df[(i+1),2]
  today <-df[(i),2]
  regression_df[i,3] <- tomorrow
  regression_df[i,2] <- today
}

regression_df <- regression_df[complete.cases(regression_df),] #exclude any rows with missing data

#####################################################################################################
