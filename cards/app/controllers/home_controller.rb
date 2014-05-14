class HomeController < ApplicationController
	def index
	end

	def newgame
		# Put all the cards into the array
		@deck = [
			"7clubs", "7diamonds", "7spades", "7hearts",
			"8clubs", "8diamonds", "8spades", "8hearts",
			"9clubs", "9diamonds", "9spades", "9hearts",
			"10clubs", "10diamonds", "10spades", "10hearts",
			"Jclubs", "Jdiamonds", "Jspades", "Jhearts",
			"Qclubs", "Qdiamonds", "Qspades", "Qhearts",
			"Kclubs", "Kdiamonds", "Kspades", "Khearts",
			"Aclubs", "Adiamonds", "Aspades", "Ahearts"
		]
		@deck.shuffle!
		render 'index'
	end
	
end
