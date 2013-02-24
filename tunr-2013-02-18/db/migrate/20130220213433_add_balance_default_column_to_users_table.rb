class AddBalanceDefaultColumnToUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :balance
    add_column :users, :balance, :decimal, :default => 0
  end
end
