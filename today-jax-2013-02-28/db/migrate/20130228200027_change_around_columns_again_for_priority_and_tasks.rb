class ChangeAroundColumnsAgainForPriorityAndTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :color
    add_column :priorities, :color, :string, :default => '#FFFFFF'
  end
end
