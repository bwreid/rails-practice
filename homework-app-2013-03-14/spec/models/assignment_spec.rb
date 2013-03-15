# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  group_size :integer
#  students   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Assignment do
  describe '.create' do
    it 'should create an instance of assignment and save it to the database IFF it has a name, a group size, and students' do
      assignment = Assignment.create( :name => 'assignment', :group_size => 3, :students => 'alex,brian,cam,dana,ed,felicia' )
      expect(assignment).to be_an_instance_of(Assignment)
      expect(assignment.id).to_not be nil
      expect(assignment.name).to eq('assignment')
      expect(assignment.group_size).to eq(3)
      expect(assignment.students).to eq('alex,brian,cam,dana,ed,felicia')

      assignment2 = Assignment.create
      expect(assignment2.id).to be nil

      assignment3 = Assignment.create( :name => 'x' )
      expect(assignment3.id).to be nil

      assignment4 = Assignment.create( :group_size => 4 )
      expect(assignment4.id).to be nil

      assignment5 = Assignment.create( :students => 'x,y,z' )
      expect(assignment5.id).to be nil
    end

    it 'fails to save if there are no students at all' do
      assignment = Assignment.create( :name => 'assignment', :group_size => 0, :students => '' )
      expect(assignment.id).to be nil
    end
  end
end
