class ChangeIdTypesToInteger < ActiveRecord::Migration
  def change
    remove_column :mixtapes, :user_id
    add_column :mixtapes, :user_id, :integer
  end
end
