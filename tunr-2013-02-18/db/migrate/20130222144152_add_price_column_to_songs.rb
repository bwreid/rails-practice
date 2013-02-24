class AddPriceColumnToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :price, :decimal, :default => 0.99
    add_column :songs, :purchased, :boolean, :default => false
  end
end
