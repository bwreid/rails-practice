class CreateIngredientsAndRecipesJoinTable < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes, :id => false do |j| # THERE'S NO PRIMARY KEY
      j.integer :ingredient_id # THESE ARE SINGULAR
      j.integer :recipe_id # THESE ARE SINGULAR
    end
  end
end
