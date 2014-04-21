class Renamefield < ActiveRecord::Migration
  def change
  	rename_column :patients, :currentstate, :workflow_state
  end
end
