@menu_items = [
  {
  	name: "Hot dog",
  	price: 3.5,
  	healthy: false
  },
  {
  	name: "Salad",
  	price: 4.15,
  	healthy: true
  },
  {
  	name: "Burger",
  	price: 5,
  	healthy: false
  },
  {
  	name: "Tuna Salad sandwich",
  	price: 5.75,
  	healthy: true
  }

]

def make20long(str)
	while str.length < 20 do
		str << " "
	end
	return str
end

def showMenu
	puts ""
	puts "Todays Menu at The IronYard"
	@menu_items.each do |item|
		puts "  " + make20long(item[:name]) + "  " + sprintf('%.2f', item[:price])  +  (item[:healthy] ? "   (healthy menu)" : "")
	end
end

showMenu