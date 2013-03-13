class ChangeColumnsInPrioritiesAndTasks < ActiveRecord::Migration
  def change
    remove_column :priorities, :user_id
    remove_column :priorities, :priority_id
    remove_column :tasks, :level
    add_column :priorities, :level, :integer
    add_column :tasks, :user_id, :integer
    add_column :tasks, :priority_id, :integer
  end
end
