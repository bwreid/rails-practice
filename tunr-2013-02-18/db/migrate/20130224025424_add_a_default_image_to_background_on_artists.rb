class AddADefaultImageToBackgroundOnArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :background
    add_column :artists, :background, :string, :default => '/assets/default.png'
  end
end
