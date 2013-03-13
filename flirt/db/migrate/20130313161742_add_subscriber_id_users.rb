class AddSubscriberIdUsers < ActiveRecord::Migration
  add_column :users, :subscriber_id, :integer
end
