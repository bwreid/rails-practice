# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  attr_accessible :name, :image, :song_ids
  validates :name, :image, :presence => true
  has_many :songs
  has_many :artists, :through => :songs
  has_and_belongs_to_many :users

  def owns_entire_album?(user)
    (user.mixtapes.map(&:songs).flatten.uniq & self.songs).count == self.songs.count
  end

  def value(user)
    value = self.songs.map(&:price).reduce(:+)
    bought = (user.mixtapes.map(&:songs).flatten.uniq & self.songs).map(&:price).reduce(:+)
    bought.nil? ? value : value -= bought
  end
end
