class CreateRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :course
      t.text :instructions
      t.integer :serving_size
      t.integer :prep_time
      t.text :image
      t.integer :books_id
      t.timestamps
    end
  end
end
