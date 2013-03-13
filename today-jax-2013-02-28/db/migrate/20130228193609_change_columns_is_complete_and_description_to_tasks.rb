class ChangeColumnsIsCompleteAndDescriptionToTasks < ActiveRecord::Migration
  remove_column :priorities, :description
  remove_column :priorities, :due_date
  remove_column :priorities, :is_complete
  add_column :tasks, :description, :string
  add_column :tasks, :due_date, :date
  add_column :tasks, :is_complete, :boolean, :default => false
end
