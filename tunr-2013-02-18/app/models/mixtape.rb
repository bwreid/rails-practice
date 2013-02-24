# == Schema Information
#
# Table name: mixtapes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Mixtape < ActiveRecord::Base
  attr_accessible :name, :user_id, :song_ids
  belongs_to :user
  has_and_belongs_to_many :songs
  validates :name, :presence => true
end
