#possible_words = ["jackass", "trumptower", "iron yard", "tall lamp"]
#test

#f = File.new("dictionary.txt", "r")
#possible_words = IO.readlines('dictionary.txt')


def get_new_guess
  puts "Please choose a letter: (enter ! to quit)"
  letterchoice = gets.chomp
end


def search_for_letter(letter)
found = false 
for i in (0..@my_len-1)
  if letter == @target_word[i] #found a match!
    @display_word[i] = letter  #put the letter in the same position in displayed word, replacing the underscore
    found = true
  end
end
if not found then
  @guessed_letters << letter
end
@unguessedletters.delete!(letter)
end


# Initializations...

#Read dictionary into array: possible_words
possible_words = []
f = File.open("dictionary.txt", "r")
f.each_line do |line|
  possible_words.push(line)
end
f.close

game_on = true

#*************************************************
while true do # The big while loop (outer loop)

my_guesses = 0
@guessed_letters = ""
@unguessedletters = "abcdefghijklmnopqrstuvwxyz"

i = rand(possible_words.length - 1)

@target_word = possible_words[i]
@target_word.strip!
@my_len = @target_word.length
puts "The word is #{@my_len} characters long"

if @my_len > 12 
	max_guesses = 6
elsif @my_len > 8
	max_guesses = 8
else
	max_guesses = 10
end	

#Build the word we're going to display, initially with ALL underscores
@display_word = ""
@my_len.times do
  @display_word << '_'
  end
puts "" #print a blank line 
puts @display_word


# TESTING
# puts "For testing, here is the target word: " + @target_word

# This is the while loop for a single game (inner while loop)
while game_on
  choice = get_new_guess
  
  if choice == "!"
  	break;
  end

  search_for_letter(choice)
  puts ""
  puts "Guessed Letters: " + @guessed_letters
  puts "UNguessed letters: " + @unguessedletters
  puts "*******************"
  puts  @display_word
  puts "*******************"

  if @display_word == @target_word
    puts "Horray, YOU WON!!"  
    break
  end
  
  my_guesses += 1
  if my_guesses >= max_guesses
    puts "GAME OVER - too many guesses"
    break
  end

end # end of the single game

break if choice == '!'
puts "Would you like to play again? (y or n)"
break if gets.chomp != 'y'

end #end the big while loop