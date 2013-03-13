# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  first           :string(255)
#  last            :string(255)
#  photo           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :email, :first, :last, :photo, :password, :password_confirmation
  has_secure_password
  validates :username, :email, :presence => true
  has_many :tasks, :inverse_of => :user
  has_many :priorities, :inverse_of => :user

  def name
    first.present? ? "#{first.capitalize}" : "#{username}"
  end

end