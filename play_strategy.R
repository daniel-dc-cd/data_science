# Strategy for the dealer
score <- score_hand(hands[hands$player == "dealer",])
while(score<17){
  newcard<-deal(playblackjack)
  newcard$player<- "dealer"
  hands<-rbind(hands,newcard)
  score<-score_hand(hands[hands$player == "dealer",])
}
if (sum(hands$values[hands$player == "dealer"],na.rm = TRUE)>10){
  hands$value[hands$player == "dealer" & hands$face=="ace"]<- 1
}else{
  hands$value[hands$player == "dealer" & hands$face=="ace"]<- 11
}
