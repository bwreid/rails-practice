# == Schema Information
#
# Table name: codes
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Code < ActiveRecord::Base
  attr_accessible :url
  has_many :characters

  after_save :get_data

  private
  def get_data
    html = HTTParty.get(self.url)
    doc = Nokogiri::HTML(html)
    hex = []
    char = []
    doc.css('tr td:nth-child(n+3)').each { |x| hex << x.text if x.text.length == 2 }
    doc.css('tr td:nth-child(n+3)').each { |x| char << x.text if x.text.length == 1 }

    count = 0
    hex.length.times do
      self.characters << Character.create( hex: hex[count], symbol: char[count] )
      count += 1
    end

  end
end
