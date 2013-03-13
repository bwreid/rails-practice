class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :activity
      t.integer :value
      t.string :unit
      t.date :when_completed
      t.integer :user_id
      t.timestamps
    end
  end
end
