class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :color, :default => '#FFFFFF'
      t.integer :level
      t.timestamps
    end
  end
end
