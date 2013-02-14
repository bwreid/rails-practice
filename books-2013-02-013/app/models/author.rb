# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  dob        :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :text
#

class Author < ActiveRecord::Base
  attr_accessible :name, :dob, :image
  has_many :books
end
