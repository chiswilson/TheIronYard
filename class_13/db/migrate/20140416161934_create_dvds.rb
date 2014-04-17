class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
    	t.string :title
    	t.string :year
    	t.string :genre
    	t.integer :rating

        t.timestamps
    end
  end
end
