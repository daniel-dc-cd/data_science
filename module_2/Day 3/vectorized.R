abs_long <- function(vec){
  for (i in 1:length(vec)){
    if(vec[i]<0){
      vec[i]<- -vec[i]
    }
  }
  vec
}

abs_vec <- function(vec){
  vec[vec<0] <- -vec[vec<=0]
  vec
}

long<-rep(c(-1,1),5000000)
sum(long)
system.time(abs_long(long))
system.time(abs_vec(long))
