# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Student do
  describe '.create' do
    it 'should create an instance of student IFF they have a name' do
      student = Student.create( :name => 'zed' )
      expect(student).to be_an_instance_of(Student)
      expect(student.id).to_not be nil
      expect(student.name).to eq('zed')

      student1 = Student.create
      expect(student1.id).to be nil
    end
  end
end
