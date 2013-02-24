class AddGenreSongRelationshipTable < ActiveRecord::Migration
  def change
    create_table :genres_songs, :id => false do |j|
      j.integer :genre_id
      j.integer :song_id
    end
  end
end
