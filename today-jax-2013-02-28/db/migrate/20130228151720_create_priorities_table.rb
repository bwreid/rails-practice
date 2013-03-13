class CreatePrioritiesTable < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.boolean :is_complete, :default => false
      t.integer :user_id
      t.integer :priority_id
      t.timestamps
    end
  end
end
