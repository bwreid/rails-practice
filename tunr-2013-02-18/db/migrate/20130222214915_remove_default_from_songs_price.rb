class RemoveDefaultFromSongsPrice < ActiveRecord::Migration
  def change
    remove_column :songs, :price
    add_column :songs, :price, :decimal
  end
end
