# Heuristic Models (Cost Function Extension)
############################################################
# Look at the seattle weather in the data folder.
# Come up with a heuristic model to predict if
# it will rain today. Keep in mind this is a time series,
# which means that you only know what happened 
# historically (before a given date). One example of a
# heuristic model is: it will rain tomorrow if it rained
# more than 1 inch (>1.0 PRCP) today. Describe your heuristic
# model here

#############################################################

##################### Your model Here #######################

#############################################################

# Examples:
# if it rained yesterday it will rain today
# if it rained yesterday or the day before, it will rain today

# Here is an example of how to build and populate 
# a heuristic model
library(tidyverse)
df <- read.csv("~/data/seattle_weather_1948-2017.csv")

numrow = 25549

heuristic_df <- data.frame("Yesterday" = 0,
                           "Today" = 0,
                           "Tomorrow" = 0,
                           "Guess" = FALSE,
                           "Rain Tomorrow" = FALSE,
                           "Correct" = FALSE,
                           "True Positive" = FALSE,
                           "False Positive" = FALSE,
                           "True Negative" = FALSE,
                           "False Negative" = FALSE)

# Now let's populate our heuristic model guessess

df$PRCP = ifelse(is.na(df$PRCP),
                 ave(df$PRCP, FUN = function(x) mean(x, na.rm = TRUE)),
                 df$PRCP)

for (z in 1:numrow){
  i = z + 2
  yesterday = df[i-2,2]
  today = df[i-1,2]
  tomorrow = df[i,2]
  if (tomorrow == 0){
    rain_tomorrow = FALSE
  }else{
    rain_tomorrow = TRUE
  }
  heuristic_df[z,1] = yesterday
  heuristic_df[z,2] = today
  heuristic_df[z,3] = tomorrow
  heuristic_df[z,4] = FALSE # Label all guesses as false
  heuristic_df[z,5] = rain_tomorrow
  heuristic_df[z,7] = FALSE
  heuristic_df[z,8] = FALSE
  heuristic_df[z,9] = FALSE
  heuristic_df[z,10] = FALSE
  
  if ((today > 0) & (yesterday > 0)){
    heuristic_df[z,4] = TRUE
  }
  if (heuristic_df[z,4] == heuristic_df[z,5]){
    heuristic_df[z,6] = TRUE
    if (heuristic_df[z,4] == TRUE){
      heuristic_df[z,7] = TRUE #true positive
    }else{
      heuristic_df[z,9] = TRUE #True negative
    }
  }else{
    heuristic_df[z,6] = FALSE
    if (heuristic_df[z,4] == TRUE){
      heuristic_df[z,7] = TRUE #false positive
    }else{
      heuristic_df[z,9] = TRUE #false negative
    }
  }
}

# Split data into training and testing
## enter split function here to make h_train and h_test subsets of the data






# Calculate the accuracy of your predictions
# we used this simple approach in the first part to see what percent of the time we where correct 
# calculated as (true positive + true negative)/ number of guesses







# Calculate the precision of your prediction
# precision is the percent of your postive prediction which are correct
# more specifically it is calculated (num true positive)/(num tru positive + num false positive)





# Calculate the recall of your predictions
# recall the percent of the time you are correct when you predict positive
# more specifically it is calculated (num true positive)/(num tru positive + num false negative)





# The sum of squared error (SSE) of your predictions