class AddBackgroundColumnToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :background, :string
  end
end
