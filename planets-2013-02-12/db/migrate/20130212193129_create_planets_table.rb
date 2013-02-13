class CreatePlanetsTable < ActiveRecord::Migration
  def change # MAKE THIS CHANGE SO, NEW RUBY CONVENTION
    create_table :planets do |t| # RUBY FUNCTION THAT WILL CREATE THE TABLE
      t.string :name # 'string' TYPE AND 'name' IS THE COLUMN NAME
      # 'string' AUTOMATICALLY CREATES A VARCHAR 255
      t.text :image
      t.float :orbit
      t.float :mass
      t.float :diameter
      t.integer :moons
      # PRIMARY KEY IS AUTO GENERATED

      # THE FOLLOWING SHOULD ALWAYS BE CREATED
      t.timestamps # THIS CREATES A 'created_at' AND 'updated_at' COLUMN
    end
  end
end
