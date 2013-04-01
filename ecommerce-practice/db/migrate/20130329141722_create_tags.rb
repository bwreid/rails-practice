class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, uniqueness: true
      t.timestamps
    end
  end
end
