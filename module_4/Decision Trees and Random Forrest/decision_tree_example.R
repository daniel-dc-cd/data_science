# Decision Tree
# Using the same seattle weather data as last chapter develop a decision tree

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


View(regression_df[seq(1,20,1),])

# Train decision tree using parsnip, a great library for training models!
# Create binary variable for rain tomorrow
regression_df$Tomorrow_bin<-regression_df$Tomorrow>0
clf<-decision_tree(mode="regression")
clf<-fit(clf, Tomorrow ~ Today, data = regression_df)
clf$fit$y<-clf$fit$y>0.5

#we can calculate the accuarcy using score
score = sum(regression_df$Tomorrow_bin==clf$fit$y) / length(regression_df$Tomorrow_bin)
print(score)

#we can also make a simple confusion matrix
confusion_matrix<-table(clf$fit$y, regression_df$Tomorrow_bin)
names(attributes(confusion_matrix)$dimnames)<-c("Predicted", "Actual")
confusion_matrix

#Here is a bit nicer matrix
image(confusion_matrix, xlab="Predicted", ylab="Actual", xaxt="n", yaxt="n")
axis(side = 1, at=c(0,1), labels=c("FALSE","TRUE"))
axis(side = 2, at=c(0,1), labels=c("FALSE","TRUE"))

