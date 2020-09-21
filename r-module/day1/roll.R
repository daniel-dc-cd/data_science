roll <- function(die,p){
  dice<-sample(die,2,replace = TRUE,prob = p)
  sum(dice)
}

p <- c(1/6,1/6,1/6,1/6,1/6,1/6)

