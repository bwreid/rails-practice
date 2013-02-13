# == Schema Information
#
# Table name: mountains
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :text
#  location   :string(255)
#  elevation  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mountain < ActiveRecord::Base
  attr_accessible :name, :image, :location, :elevation
end
