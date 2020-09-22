# Assign deck to Blackjack dataframe
Blackjack <- deck
View(Blackjack)

# Assign facecards the value of 10
facecard<-c("king","queen","jack")
Blackjack$value[Blackjack$face %in% facecard]
Blackjack[Blackjack$face %in% facecard,]
Blackjack$value[Blackjack$face %in% facecard]<-10

#Assign aces the value of NA
Blackjack$value[Blackjack$face == "ace"]<-NA
View(Blackjack)

#Create Hearts Deck
Hearts <- deck
Hearts$value <- 0
View(Hearts)
Hearts$value[Hearts$suit == "hearts"]<-1
Hearts$value[Hearts$suit == "spades" & Hearts$face == 'queen']<-13

# Create deck2
deck2<-deck
deck2$order<-1:52

#Shuffle3() creates a new shuffled deck
shuffle3<- function(curr_deck){
  mixer<- sample(1:52, size = 52)
  curr_deck<- curr_deck[mixer,]
  View(curr_deck)
}

#Shuffle4() creates a new shuffled deck and assigns it to the global "deck"
shuffle4<- function(curr_deck){
  mixer<- sample(1:52, size = 52)
  curr_deck<- curr_deck[mixer,]
  assign("deck", curr_deck[-1,],envir = globalenv())
}

#Deal two players from hearts deck.
deal_hearts<- function() {
  playhearts<- shuffle4(Hearts)
  h_player1<- head(playhearts, 13)
  h_player2<- tail(playhearts, 13)
  print("----Hearts player1----")
  print(h_player1)
  print("----Hearts player2----")
  print(h_player2)
}

#Deal two players & dealer from blackjack deck.
deal_jacks<- function() {
  playjacks<- shuffle4(Blackjack)
  j_player1<- head(playjacks, 2)
  j_player2<- tail(playjacks, 2)
  dealer<- playjacks[c(10:11),1:3]
  print("----Blackjack player1----")
  print(j_player1)
  print("----Blackjack player2----")
  print(j_player2)
  print("----Blackjack dealer----")
  print(dealer)
}
