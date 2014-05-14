class CreateGolfers < ActiveRecord::Migration
  def change
    create_table :golfers do |t|
    	t.string :name
    	t.string :nationality
    	t.string :birthdate

      	t.timestamps
    end
  end
end
