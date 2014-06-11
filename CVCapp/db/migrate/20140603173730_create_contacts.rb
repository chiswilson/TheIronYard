class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :account_id
      t.string :misc

      t.timestamps
    end
  end
end
