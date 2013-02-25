# == Schema Information
#
# Table name: artists
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  background  :string(255)
#  description :text
#

class Artist < ActiveRecord::Base
  attr_accessible :name, :image, :album_ids, :description, :background, :song_ids
  validates :name, :image, :presence => true, :uniqueness => true
  has_many :songs
  has_many :albums, :through => :songs # NOT BELONGS TO
end
