class CreateJoinTableForProductsTags < ActiveRecord::Migration
  def change
    create_table :products_tags do |j|
      j.integer :product_id
      j.integer :tag_id
    end
  end
end
