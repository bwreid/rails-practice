class AddAlbumUserRelationshipTable < ActiveRecord::Migration
  def change
    create_table :albums_users, :id => false do |j|
      j.integer :album_id
      j.integer :user_id
    end
  end
end
