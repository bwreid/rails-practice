# == Schema Information
#
# Table name: planets
#
#  id       :integer          not null, primary key
#  image    :text
#  name     :string(255)
#  orbit    :float
#  diameter :float
#  mass     :float
#  moons    :integer
#

class Planet < ActiveRecord::Base # THIS ACCESSES A CLASS THAT HAS TONS OF FUNCTIONALITY THAT ALLOWS
                                  # ANOTHER CLASS TO TALK TO A DATABASE
  attr_accessible :name, :image, :diameter, :orbit, :mass, :moons # MAKE THE FOLLOWING PROPERTIES ACCESSIBLE

end
