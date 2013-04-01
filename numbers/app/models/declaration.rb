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

  after_save :make_words

  def make_words
    response = HTTParty.get(self.url)
    response.gsub("\n",'').split.map{ |w| self.words << Word.new(value: w) }
  end
end
