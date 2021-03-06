class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_admin, default: false
      t.decimal :balance, default: 0.0
      t.timestamps
    end
  end
end
