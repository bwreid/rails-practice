class AddMixtapeSongRelationshipTable < ActiveRecord::Migration
  def change
    create_table :mixtapes_songs, :id => false do |j|
      j.integer :mixtape_id
      j.integer :song_id
    end
  end
end
