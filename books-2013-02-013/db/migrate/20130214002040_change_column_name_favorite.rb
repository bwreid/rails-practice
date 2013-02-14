class ChangeColumnNameFavorite < ActiveRecord::Migration
  def change
    rename_column :books, :favorite?, :favorite
  end
end
