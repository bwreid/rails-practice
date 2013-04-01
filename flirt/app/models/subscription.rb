# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  plan       :string(255)
#  duration   :integer
#  cost       :decimal(, )
#  num_photos :integer          default(0)
#  num_emails :integer          default(0)
#  num_texts  :integer          default(0)
#  is_alist   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ActiveRecord::Base
  attr_accessible :cost, :duration, :is_alist, :num_emails, :num_photos, :num_texts, :plan
  has_many :subscribers
end
