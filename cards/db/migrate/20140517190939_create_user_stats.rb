class CreateUserStats < ActiveRecord::Migration
  def change
    create_table :user_stats do |t|
      t.integer :user_id
      t.integer :total_games
      t.integer :total_guesses
      t.integer :best_game

      t.timestamps
    end
  end
end
