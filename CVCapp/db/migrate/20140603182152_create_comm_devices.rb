class CreateCommDevices < ActiveRecord::Migration
  def change
    create_table :comm_devices do |t|
      t.integer :contact_id
      t.string :name
      t.string :dev_type
      t.string :number
      t.string :carrier
      t.string :encryption_key

      t.timestamps
    end
  end
end
