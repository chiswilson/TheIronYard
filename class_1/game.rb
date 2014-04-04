puts "Welcome to Tic Tac Toe"
game_on = true
#player1 = gets.chomp
#puts "Player 1 says: "
#puts player1.inspect

game_board = [ [0,0,0], [0,0,0], [0,0,0] ]

def display_board
puts " #{display_player(game_board[0][0])}  |  #{display_player(game_board[0][1])}  |  #{display_player(game_board[0][2])} "
puts '-----------'
puts "   |   |   "
puts '-----------'
puts "   |   |   "
puts "#{}"
end

def display_player(player_choice)
	if player_choice == 1
		'X'
	elsif player_choice == 2	
		'O'
	else
		''
	end
end

while game_on == true
	display_board
	puts "Player 1 Choice (1-9):"
	player_1_choice = gets.chomp
end



