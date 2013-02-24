# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  filename   :string(255)
#  image      :string(255)
#  album_id   :integer
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  purchased  :boolean          default(FALSE)
#  price      :decimal(, )
#

class Song < ActiveRecord::Base
  attr_accessible :price, :name, :image, :filename, :album_id, :artist_id, :genre_ids, :mixtape_ids
  validates :name, :filename, :presence => true
  validates :price, :numericality => { :greater_than => 0 }
  belongs_to :artist
  belongs_to :album
  has_and_belongs_to_many :mixtapes
  has_and_belongs_to_many :genres

  def am_i_empty
    self.delete if self.name.nil?
  end

end
