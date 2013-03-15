class CreateAssignmentsTable < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :group_size
      t.text :students
      t.timestamps
    end
  end
end
