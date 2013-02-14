class CreateBooksTable < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :chef
      t.string :cuisine
      t.text :image
      t.timestamps
    end
  end
end
