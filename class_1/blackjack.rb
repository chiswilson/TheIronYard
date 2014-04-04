def get_card
  rand(1..11)
  end

def update_my_cards
    @my_total = 0
	print "Your cards are: "
	@cards_in_hand.each do |card|
		print card.to_s + " "
		@my_total += card
	end
	print "   for a total of: " + @my_total.to_s
	puts ""
end

def update_dealer_cards
    @dealer_total = 0
	print "DEALER cards are: "
	@dealer_cards_in_hand.each do |card|
		print card.to_s + " "
		@dealer_total += card
	end
	print "   for a total of: " + @dealer_total.to_s
	puts ""
end


####### The big while loop ******************************
while true do

@cards_in_hand = []
@dealer_cards_in_hand = []
@my_total = 0
@dealer_total = 0
busted = false

# get my 2 cards from dealer
@cards_in_hand.push(get_card)
@cards_in_hand.push(get_card)
update_my_cards

# while I'm getting more cards
while true do
	puts "Would you like another card? (y or n)"
	break if gets.chomp != 'y'
	@cards_in_hand.push(get_card)
	update_my_cards
	if @my_total > 21 then
	 	puts "You're Bust, Dude, You LOSE!"
	 	busted = true
	 	break
	end
end # End while I'm getting cards

if busted then
  puts "Would you like to play again? (y or n)"
  exit unless gets.chomp == 'y'
  next #they must have hit 'y', so go back to start of big while loop
end	 

update_my_cards

puts ""
# Dealer gets 2 cards
@dealer_cards_in_hand.push(get_card)
@dealer_cards_in_hand.push(get_card)
update_dealer_cards

# While dealer getting more cards
while true do
	if @dealer_total > 21 then
		puts "Dealer Busted, You WIN!"
		busted = true
		break
	elsif @dealer_total < 17 then
		sleep(1)
		@dealer_cards_in_hand.push(get_card) #dealer gets another card
		update_dealer_cards
	else #must be between 17-21
		# update_dealer_cards
	    break 	
	end
end #End while dealer getting more cards

if busted then
  puts "Would you like to play again? (y or n)"
  exit unless gets.chomp == 'y'
  next #they must have hit 'y', so go back to start of big while loop
end	



# See who won!
if @my_total > @dealer_total
	puts "You WON!"
elsif @my_total < @dealer_total
	puts "Dealer Wins, You lose"
else
	puts "Its a tie!"
end	

puts "Would you like to play again? (y or n)"
if gets.chomp != 'y'
	break 
end
end #End the big while loop