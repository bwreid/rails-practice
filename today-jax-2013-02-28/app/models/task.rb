# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  priority_id :integer
#  description :string(255)
#  due_date    :date
#  is_complete :boolean          default(FALSE)
#

class Task < ActiveRecord::Base
  attr_accessible :name, :color, :user_id, :priority_id
  validates :name, :presence => true
  belongs_to :user, :inverse_of => :tasks
  belongs_to :priority, :inverse_of => :tasks
end
