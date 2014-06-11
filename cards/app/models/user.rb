class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_stat   

  def add_score(guesses)
  	tguesses = self.user_stat.total_guesses
	tgames =   self.user_stat.total_games
	bestgame = self.user_stat.best_game

	tgames = tgames + 1
	tguesses = tguesses + guesses.to_i
	if (guesses.to_i < bestgame) || (bestgame == 0)
		bestgame = guesses.to_i
	end
	self.user_stat.update(total_guesses: tguesses, total_games: tgames, best_game: bestgame)

  	puts "calling add_score: #{guesses}"
  end
end
