class AddColumnUserIdToPriorities < ActiveRecord::Migration
  def change
    add_column :priorities, :user_id, :integer
  end
end
