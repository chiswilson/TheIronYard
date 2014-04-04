class Monkey
	attr_accessor :type, :color, :size

	def initialize(type) 
		@type = type
		@color = "black"
		@size = 25
	end

	def swing
		puts "I'm swinging from a tree!"
	end

end

class Sub_Monkey < Monkey
	def sayHello
		puts "Hello, Human"
	end
end


my_monkey = Sub_Monkey.new('normal')
my_monkey.swing
my_monkey.sayHello
