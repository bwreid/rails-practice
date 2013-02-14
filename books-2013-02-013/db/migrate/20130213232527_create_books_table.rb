class CreateBooksTable < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.boolean :favorite?
      t.timestamps
    end
  end
end
