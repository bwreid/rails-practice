class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.text :image
      t.decimal :cost
      t.float :lat
      t.float :lon
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
