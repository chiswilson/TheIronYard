class Horse

  attr_accessor :name, :position

  #Class Vars
  @@no_of_horses=0

  def initialize(name)
    # puts "Horse #{name} is initiated!"
    @name = name
    @position = 0
    @@no_of_horses += 1
  end

  def move_ahead
    @position += rand(4)
  end

  def move_ahead_by(amount)
    @position += amount
  end

  def reset
    @position = 0
  end

end


class Horserace

  CODE_WORDS = { "move" => 3, "gofast" => 5, "speedy" => 8 }

  def initialize(*opts)
    @horses=Array.new
    4.times do |i|
      @horses.push(Horse.new(opts[i]))
      end         
  end


  def start
    display_horses
    while true do
      puts "'move' => 3, 'gofast' => 5, 'speedy' => 8" 
      puts "Enter some input please:"
      input = gets.chomp
      if input == "!" 
        break 
      end
      amount = CODE_WORDS[input]
      if amount.nil?
        @horses[0].move_ahead
      else
        @horses[0].move_ahead_by(amount)
      end 
      @horses[1].move_ahead
      @horses[2].move_ahead
      @horses[3].move_ahead

      display_horses
      if   (@horses[0].position >= 100) || (@horses[1].position >= 100) \
        || (@horses[2].position >= 100) || (@horses[3].position >= 100)
        # RACE IS OVER
        # This code doesn't really account for ties.  Could be improved...
            tempWinner = @horses[0].name
            i = @horses[0].position
            if @horses[1].position > i
              tempWinner = @horses[1].name
              i = @horses[1].position
            end
            if @horses[2].position > i
              tempWinner = @horses[2].name
              i = @horses[2].position
            end
            if @horses[3].position > i
              tempWinner = @horses[3].name
              i = @horses[3].position
            end
            puts "The winner is: " + tempWinner
            break
        end
    end # while
  end # end the start method


private
  def show_horse(horse)
    name = horse.name
    horse.position.times {
      print "."
    }
    print "*" + name + "*"
    puts "" 
  end


  def display_horses
    system "clear"
    puts ""
    puts "****************************************************************************************************"
    for i in 0..3 do
      show_horse(@horses[i])
    end 
    puts "****************************************************************************************************"
  end


end
