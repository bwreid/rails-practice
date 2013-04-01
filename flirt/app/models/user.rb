# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  userable_id     :integer
#  userable_type   :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password
  belongs_to :userable, :polymorphic => true
  validates :username, :email, :presence => true

  def sub
    self.userable if self.userable.is_a?(Subscriber)
  end

  def admin
    self.userable if self.userable.is_a?(Administrator)
  end

end
