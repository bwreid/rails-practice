class RemoveDefaultFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :balance
    add_column :users, :balance, :decimal
  end
end
