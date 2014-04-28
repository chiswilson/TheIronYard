class CreateHpconnects < ActiveRecord::Migration
  def change
    create_table :hpconnects do |t|
    	t.string :name
    	t.integer :hospital_id
    	t.integer :patient_id

    	t.timestamps
    end
  end
end
