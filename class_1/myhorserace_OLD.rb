require "./horseClass.rb"

code_words = { "gofast" => 3, "butter" => 5, "speedy" => 8 }
# finish_positions = []

@myhorse = Horse.new("Charlie (YOU!)")
# puts myhorse.name

@other_horses = []
@other_horses[0] = Horse.new("Jack")
@other_horses[1] = Horse.new("Billy")
@other_horses[2] = Horse.new("Golden")


def display_horses
	puts ""
	puts "****************************************************************************************************"
    show_horse(@myhorse)
    for i in 0..2 do
    	show_horse(@other_horses[i])
    end	
    puts "****************************************************************************************************"
end

def show_horse(horse)
	pos = horse.position
	name = horse.name
	pos.times {
		print "."
	}
	print "*" + name + "*"
	puts ""	
	end

display_horses

while true do
	puts "Enter some input please:"
	input = gets.chomp
	if input == "!" 
	  break 
	end
	amount = code_words[input]
	if amount.nil?
	  @myhorse.move_ahead
	else
	  @myhorse.move_ahead_by(amount)
	end	
	@other_horses[0].move_ahead
	@other_horses[1].move_ahead
	@other_horses[2].move_ahead

	display_horses
	if (@myhorse.position >= 100) || (@other_horses[0].position >= 100) \
		|| (@other_horses[1].position >= 100) || (@other_horses[2].position >= 100)
		# RACE IS OVER
        tempWinner = @myhorse.name
        i = @myhorse.position
        if @other_horses[0].position > i
       	  tempWinner = @other_horses[0].name
       	  i = @other_horses[0].position
       	end
       	if @other_horses[1].position > i
       	  tempWinner = @other_horses[1].name
       	  i = @other_horses[1].position
       	end
       	if @other_horses[2].position > i
       	  tempWinner = @other_horses[2].name
       	  i = @other_horses[2].position
       	end

       	puts "The winner is: " + tempWinner

        break
    end





end