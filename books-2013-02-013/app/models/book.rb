# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  genre      :string(255)
#  favorite   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :text
#  author_id  :integer
#

class Book < ActiveRecord::Base
  attr_accessible :title, :genre, :favorite, :image, :author_id
  belongs_to :author
end
