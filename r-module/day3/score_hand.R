score_hand<- function(analyzedhand){
  if (sum(analyzedhand$face == "ace")>0){
    if(sum(analyzedhand$value,na.rm = TRUE)>10){
      score<-sum(analyzedhand$value,na.rm = TRUE) + 1
    }else{
      score<-sum(analyzedhand$value,na.rm = TRUE) + 11
    }
  }else{
    score<-sum(analyzedhand$value,na.rm = TRUE)
  }
  score
}
