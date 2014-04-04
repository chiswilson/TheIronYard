# You will be creating a dessert shop which sells: Candy (sells by the pound), Cookies (by the dozen), and Ice Cream 
#(by the scoop). You will create a minimum of 3 candies, 3 cookies, and 3 flavors of ice cream, all which inherit 
#methods from the parent classes.

# Candy/Cookie/Ice Cream will all inherit from Dessert Item which will contain only one data field: name.

# The Dessert Shop will have a constant tax rate of 8%. 

# You will also have a class named checkout, which will be in charge of storing all of the items I'm trying to order. 
#It will display out how much I'm trying to order of said item, while also displaying the price.

# So, the "Menu" will display each item which I can choose via some user input. Then it will ask me how much of said 
#item I want, displaying how much it will cost me for the measurement. Ie: "Chocolate Chip Cookie(2.99/dozen). 
#How many cookies do you want?"

# I should also have the option to view items from any category. Ie: User types in "view" from your initial menu. 
#It will bring him to another screen that can view the categories. If I select a category it will display the items 
#from that category with the prices.

class Dessert
	attr_accessor :name

	def initialize(name)
		@name = name
	end
end

class Candy < Dessert
	attr_accessor :price, :flavor

	# def initialize(name, price, flavor)
	# 	@name = name
	# 	@price = price
	# 	@flavor = flavor
	# end
end

class Cookie < Dessert
	attr_accessor :price, :flavor
end

class Icecream < Dessert
	attr_accessor :price, :flavor
end


candy1 = Candy


