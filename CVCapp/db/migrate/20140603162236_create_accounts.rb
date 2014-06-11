class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_num
      t.string :name
      t.string :description
      t.integer :max_contacts

      t.timestamps
    end
  end
end
