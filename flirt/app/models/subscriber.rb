# == Schema Information
#
# Table name: subscribers
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tagline         :string(255)
#  bio             :string(255)
#  preferences     :string(255)
#  age             :integer
#  gender          :string(255)
#  occupation      :string(255)
#  location        :string(255)
#  status          :string(255)
#  ethnicity       :string(255)
#  interests       :string(255)
#  income          :decimal(, )
#  subscription_id :integer
#  expires         :date
#

class Subscriber < ActiveRecord::Base
  attr_accessible :tagline, :bio, :preferences, :age, :gender, :occupation, :location, :status, :ethnicity, :interests, :income, :expires
  has_one :user, :as => :userable, dependent: :destroy
  belongs_to :subscription
  validates :bio, :tagline, :gender, :presence => true
  validates :age, :numericality => { :greater_than => 17 }

  def has_subscription?
    self.subscription.present?
  end

  def purchase_plan(name)
    plan = Subscription.where( :plan => name ).first
    # binding.pry
    if plan
      self.subscription = plan
      self.expires = Date.current + plan.duration.month
      self.save
    end
  end
end
