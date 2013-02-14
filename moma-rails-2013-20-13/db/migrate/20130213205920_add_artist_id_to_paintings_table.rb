class AddArtistIdToPaintingsTable < ActiveRecord::Migration
  def change
    add_column :paintings, :artist_id, :integer # SINGULAR NAME OF THE TABLE + ID
  end
end
