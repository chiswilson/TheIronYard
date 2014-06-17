class CreateSysMessages < ActiveRecord::Migration
  def change
    create_table :sys_messages do |t|
      t.string :contact_id
      t.string :msg
      t.string :from_addr
      t.integer :attempts
      t.integer :from_account_id
      t.integer :from_user_id

      t.timestamps
    end
  end
end
