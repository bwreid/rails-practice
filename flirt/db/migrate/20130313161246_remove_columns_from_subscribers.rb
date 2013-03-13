class RemoveColumnsFromSubscribers < ActiveRecord::Migration
  def change
    remove_column :users, [:username, :password_digest, :email]
  end
end
