class Removepatientscol < ActiveRecord::Migration
  def change
  	remove_column :patients, :hospital_id, :integer
  	remove_column :hpconnects, :name, :string
  end
end
