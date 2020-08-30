roll <- function(die,probability){
  dice<-sample(die,2,replace = TRUE,prob = probability)
  sum(dice)
}