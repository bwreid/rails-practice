# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  group_size :integer
#  students   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assignment < ActiveRecord::Base
  attr_accessible :name, :group_size, :students
  validates :name, :students, :presence => true
  validates :group_size, :numericality => { :greater_than => 0 }, :presence => true
end
