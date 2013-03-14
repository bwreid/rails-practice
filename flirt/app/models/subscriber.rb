# == Schema Information
#
# Table name: subscribers
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tagline     :string(255)
#  bio         :string(255)
#  preferences :string(255)
#  age         :integer
#  gender      :string(255)
#  occupation  :string(255)
#  location    :string(255)
#  status      :string(255)
#  ethnicity   :string(255)
#  interests   :string(255)
#  income      :decimal(, )
#

class Subscriber < ActiveRecord::Base
  attr_accessible :tagline, :bio, :preferences, :age, :gender, :occupation, :location, :status, :ethnicity, :interests, :income
  has_one :user, :as => :userable, dependent: :destroy
end
