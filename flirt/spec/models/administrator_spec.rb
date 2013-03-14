# == Schema Information
#
# Table name: administrators
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :string(255)
#  ssn        :string(255)
#  phone      :string(255)
#

require 'spec_helper'

describe Administrator do # TESTING OUT THIS CLASS

  describe '.new' do # TESTING OUT THIS CLASS METHOD
    it 'should create a new subscriber object' do
      administrator = Administrator.new
      expect(administrator).to be_an_instance_of(Administrator)
    end
  end

  describe '.create' do
    it 'has an id and was saved' do
      administrator = Administrator.create
      expect(administrator.id).to_not be nil
    end
  end

  describe '#user' do
    it 'has a user' do
      administrator = Administrator.new
      user = User.new
      administrator.user = user
      expect(administrator.user).to be_an_instance_of(User)
    end
  end

  describe '#metadata' do
    it 'has administrator properties' do
      administrator = Administrator.create(role: 'DBA', ssn: '111-22-3333', phone: '1-111-111-1111')
      expect(administrator.id).to_not be nil
      expect(administrator.role).to eq 'DBA'
      expect(administrator.ssn).to eq '111-22-3333'
      expect(administrator.phone).to eq '1-111-111-1111'
    end
  end

end
