class AddMasterAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :master_admin, :boolean
  end
end
