deal<-function(currentdeck){
  card<-currentdeck[1,]
  assign("playblackjack", currentdeck[-1,],envir = globalenv())
  card
}