class ChangeAroundColumnsFromUserToSubscriber < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    remove_column :subscribers, :username
    remove_column :subscribers, :email
    remove_column :subscribers, :password_digest
  end
end
