# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  image       :text
#  cost        :decimal(, )
#  lat         :float
#  lon         :float
#  address     :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  attr_accessible :address, :cost, :description, :image, :lat, :lon, :name, :user_id
  mount_uploader :image, ProductImageUploader
  has_and_belongs_to_many :tags
  belongs_to :user

  before_save :geolocate

  private
  def geolocate
    result = Geocoder.search(self.address).first

    if result.present?
      self.lat = result.latitude
      self.lon = result.longitude
    end
  end
end
