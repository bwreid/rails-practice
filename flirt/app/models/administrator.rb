# == Schema Information
#
# Table name: administrators
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :string(255)
#  ssn        :string(255)
#  phone      :string(255)
#

class Administrator < ActiveRecord::Base
  attr_accessible :ssn, :role, :phone
  has_one :user, :as => :userable, dependent: :destroy
  validates :role, :presence => true
end
