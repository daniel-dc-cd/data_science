# Random Forest
# Using the same seattle weather data as last chapter develop a random forest model


library(parsnip)

df <- read.csv('~/data/seattle_weather_1948-2017.csv')

numrows <- 25549 # can be as large as 25549

#create an empty dataframe to hold values
regression_df<-data.frame(matrix(, nrow=numrows, ncol=0))
regression_df$Today<-0
regression_df$Tomorrow<-0

# Populate regression DF
for(i in seq(1,numrows,1)){
  tomorrow <- df[(i+1),2]
  today <-df[(i),2]
  regression_df[i,2] <- tomorrow
  regression_df[i,1] <- today
}

regression_df <- regression_df[complete.cases(regression_df),] #exclude any rows with missing data

head(regression_df,20)

# Fit the random forest model
clf <- rand_forest(mode="regression")
clf<- fit(clf, Tomorrow ~ Today, data = regression_df)
clf$fit$predictions<-clf$fit$predictions>0.5

#we can calculate the accuarcy using score
regression_df$Tomorrow_bin<-regression_df$Tomorrow>0
score = sum(regression_df$Tomorrow_bin==clf$fit$predictions) / length(regression_df$Tomorrow_bin)
print(score)

#we can also make a simple confusion matrix
confusion_matrix<-table(clf$fit$predictions, regression_df$Tomorrow_bin)
names(attributes(confusion_matrix)$dimnames)<-c("Predicted", "Actual")
confusion_matrix

#Here is a bit nicer matrix
image(confusion_matrix, xlab="Predicted", ylab="Actual", xaxt="n", yaxt="n")
axis(side = 1, at=c(0,1), labels=c("FALSE","TRUE"))
axis(side = 2, at=c(0,1), labels=c("FALSE","TRUE"))


# From this point modify the parsnip random forest method to use two or more variables.
# Hint. Your x values should have the same number of rows but two columns. 
# You will not be able to plot the line (as it will be 3 dimensional) but you can plot the model predictions 
# agains the actual values.

###################### adjust this code to add columns here #######################################
numrows <- 25549 # can be as large as 25549

#create an empty dataframe to hold values
regression_df<-data.frame(matrix(, nrow=numrows, ncol=0))
regression_df$Today<-0
regression_df$Tomorrow<-0

# Populate regression DF
for(i in seq(1,numrows,1)){
  tomorrow <- df[(i+1),2]
  today <-df[(i),2]
  regression_df[i,2] <- tomorrow
  regression_df[i,1] <- today
}

regression_df <- regression_df[complete.cases(regression_df),] #exclude any rows with missing data
#####################################################################################################
