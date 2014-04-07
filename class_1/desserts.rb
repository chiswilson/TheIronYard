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
	attr_accessor :price, :units
	def initialize(name, price)
		@name = name
		@price = price
		@units = "/lb"
	end
end

class Cookie < Dessert
	attr_accessor :price, :units
	def initialize(name, price)
		@name = name
		@price = price
		@units = "/dozen"
	end
end

class Icecream < Dessert
	attr_accessor :price, :units
	def initialize(name, price)
		@name = name
		@price = price
		@units = "/scoop"
	end
end


class Checkout
	# try this instead of attr_accessor
	attr_reader :subtotal
	
	def initialize
	    @subtotal = 0.0
		@items = Array.new
	end

	def show_items
		@subtotal = 0.0
		puts ""
		puts "Your Shopping Cart:"
		@items.each do |item| # item here is a hash   item[:item] is the actual item in the shopping cart
			if item[:item].class == Candy
			  unitstr = "lbs"
		    elsif item[:item].class == Cookie
			  unitstr = "dozen"
		    else # ice cream
			  unitstr = "scoop(s)"
		    end
		    itemtotal = item[:item].price * item[:qnty].to_f 

			puts "  " + item[:item].name.ljust(25, " ") \
			  + (" qty:" + item[:qnty].to_s + " " + unitstr).ljust(18, " ")  \
			  + ("$" + sprintf('%.2f',itemtotal)).rjust(7, " ")

			@subtotal += itemtotal  
		end # @items.each
		puts "  ---------------------"
		puts "  Subtotal: $" + sprintf('%.2f', subtotal)
		
	end

	def add_item(item, qnty)
		@items.push({item: item, qnty: qnty})
	end

	def remove_item

	end

end

# ***************
# End of Classess
# ***************

def show_menu
	system "clear"
	puts "*** Welcome to Iron Yard Candy shop ***"
	puts "*** TODAYS MENU:"	
	# @menu_items.each do |item|
    for i in 0..@menu_items.length-1 do
    	item = @menu_items[i]
		
		puts ((i+1).to_s  + ")").ljust(9, " ") \
		  + item.name.ljust(25, " ") \
		  + "$" + sprintf('%.2f', item.price) + " " + item.units
	end
end



# create my checkout
checkout = Checkout.new

# Array of available menu items
@menu_items = Array.new
@menu_items.push(Candy.new("Chocolate morsels", 2.99))
@menu_items.push(Candy.new("Jelly beans", 2.50))
@menu_items.push(Candy.new("Choc squares", 3.00))
@menu_items.push(Candy.new("Reeses PB cups", 4.50))

@menu_items.push(Cookie.new("Choc chip cookies", 4.50))
@menu_items.push(Cookie.new("Mint cookies", 5.00))
@menu_items.push(Cookie.new("Oatmeal raisin cookies", 4.50))

@menu_items.push(Icecream.new("Chocolate chip icecream", 2.00))
@menu_items.push(Icecream.new("Peppermint icecream", 2.50))
@menu_items.push(Icecream.new("Coffee icecream", 2.75))



# testing
# checkout.add_item(@menu_items[0], 4)
# checkout.add_item(@menu_items[1], 3)
# checkout.add_item(@menu_items[5], 1)

while true do
	show_menu
	checkout.show_items
	puts ""
	puts "Please enter a command:"
	puts "(A = add item, D = delete item, C = check out, Q = quit)"
	cmd = gets.chomp.upcase
	break if cmd == 'Q'

	case cmd
	when "A"
		puts "Please enter the item number from the menu:"
		itemno = gets.chomp.to_i
		if (1..@menu_items.length).include?(itemno)
			puts "You selected: " + @menu_items[itemno-1].name
			puts "enter quantity: (#{@menu_items[itemno-1].units})"
			qnty = gets.chomp.to_i
			checkout.add_item(@menu_items[itemno-1], qnty)

		end
	when "C"
		puts "Subtotal: $" + sprintf('%.2f', checkout.subtotal)
		puts "Tax:      $" + sprintf('%.2f', 0.08 * checkout.subtotal)     
		puts "TOTAL:    $" + sprintf('%.2f', 1.08 * checkout.subtotal)  
		puts ""
		puts "enter any key to quit"
		gets
		break

	end
end


