# == Schema Information
#
# Table name: administrators
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Administrator < ActiveRecord::Base
  has_one :user, :as => :userable, dependent: :destroy
end
