# == Schema Information
#
# Table name: administrators
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Administrator do # TESTING OUT THIS CLASS

  describe '.new' do # TESTING OUT THIS CLASS METHOD
    it 'should create a new subscriber object' do
      administrator = Administrator.new
      expect(administrator).to be_an_instance_of(Administrator)
    end
  end

  describe '#user' do
    it 'has a user' do
      administrator = Administrator.new
      user = User.new
      administrator.user = user
      expect(administrator.user).to be_an_instance_of(User)
    end

    # it 'has username, email, password, and password confirmation' do
    #   subscriber = Subscriber.new( username: 'x', email: 'x@y.com', password: 'x', password_confirmation: 'x' )
    #   expect(subscriber.username).to eq('x')
    #   expect(subscriber.email).to eq('x@y.com')
    #   expect(subscriber.password).to eq('x')
    #   expect(subscriber.password_confirmation).to eq('x')
    # end
  end

  describe '.create' do
    it 'has an id and was saved' do
      administrator = Administrator.create
      expect(administrator.id).to_not be nil
    end
  end
end
