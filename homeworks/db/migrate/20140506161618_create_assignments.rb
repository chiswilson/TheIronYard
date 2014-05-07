class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.string :name
    	t.integer :course_id
    	t.integer :user_id

      	t.timestamps
    end
  end
end
