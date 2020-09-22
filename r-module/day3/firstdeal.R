hands<-deal(playblackjack)
hands$player = "p1"
for (i in 1:5){
  newcard <- deal(playblackjack)
  if (i %in% c(1,4)){
    newcard$player<- "p2"
  }else if (i %in% c(2,5)){
    newcard$player<- "dealer"
  }else{
    newcard$player<- "p1"
  }
  hands<-rbind(hands,newcard)
}