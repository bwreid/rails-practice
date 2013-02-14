class CreatePaintingsTable < ActiveRecord::Migration
  create_table :paintings do |t|
    t.string :title
    t.integer :year
    t.string :medium
    t.string :style
    t.text :image
    t.timestamps
  end
end
