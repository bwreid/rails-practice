# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  image           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  twitter         :string(255)
#  is_admin        :boolean          default(FALSE)
#  balance         :decimal(, )
#

class User < ActiveRecord::Base
  validates :name, :length => {
    :minimum => 6,
    :maximum => 14,
    :too_short => "must have at least %{count} characters",
    :too_long  => "must have at most %{count} characters" },
    :uniqueness => true
  has_secure_password
  # validates :password, :length => {
  #   :minimum => 6,
  #   :maximum => 20,
  #   :too_short => "must have at least %{count} characters",
  # :too_long  => "must have at most %{count} characters" }
  validates :image, :presence => true
  validates :balance, :numericality => { :greater_than_or_equal_to => 0 }
  attr_accessible :name, :image, :twitter, :password, :password_confirmation, :balance
  has_many :mixtapes, :inverse_of => :user
  has_and_belongs_to_many :albums

  def has_song?(song)
    self.mixtapes.map(&:songs).flatten.include?(song)
  end
end
