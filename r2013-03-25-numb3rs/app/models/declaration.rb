# == Schema Information
#
# Table name: declarations
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Declaration < ActiveRecord::Base
  attr_accessible :url
  has_many :words

  after_save :get_data
  private
  def get_data
    self.words = HTTParty.get(self.url).split.each_with_index.map{|w, i| Word.new(value: w, index: i)}
  end
end
