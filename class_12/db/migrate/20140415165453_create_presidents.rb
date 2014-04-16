class CreatePresidents < ActiveRecord::Migration
  def change
    create_table :presidents do |t|
    	t.string :name
    	t.string :terms
    	t.string :borndate
        t.timestamps
    end
  end
end
