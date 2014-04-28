class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
    	t.integer :patient_id
    	t.string :name
    	t.string :description

    	t.timestamps
    end
  end
end
