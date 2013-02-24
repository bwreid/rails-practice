class AddMixtapesTable < ActiveRecord::Migration
  def change
    create_table :mixtapes do |t|
      t.string :name
      t.string :user_id
      t.timestamps
    end
  end
end
