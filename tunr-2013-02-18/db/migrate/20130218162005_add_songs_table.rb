class AddSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :filename
      t.string :image
      t.integer :album_id
      t.integer :artist_id
      t.timestamps
    end
  end
end
