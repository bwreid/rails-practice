class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :plan
      t.integer :duration
      t.decimal :cost
      t.integer :num_photos, :default => 0
      t.integer :num_emails, :default => 0
      t.integer :num_texts, :default => 0
      t.boolean :is_alist, :default => false
      t.timestamps
    end
  end
end
