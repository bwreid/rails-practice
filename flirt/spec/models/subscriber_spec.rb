# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Subscriber do # TESTING OUT THIS CLASS
  describe '.new' do # TESTING OUT THIS CLASS METHOD

    it 'should create a new subscriber object' do
      subscriber = Subscriber.new
      expect(subscriber).to be_an_instance_of(Subscriber)
    end

    it 'has username, email, password, and password confirmation' do
      subscriber = Subscriber.new( username: 'x', email: 'x@y.com', password: 'x', password_confirmation: 'x' )
      expect(subscriber.username).to eq('x')
      expect(subscriber.email).to eq('x@y.com')
      expect(subscriber.password).to eq('x')
      expect(subscriber.password_confirmation).to eq('x')
    end
  end

  describe '.create' do

    it 'has an id and was saved' do
      subscriber = Subscriber.create( username: 'x', email: 'x@y.com', password: 'x', password_confirmation: 'x' )
      expect(subscriber.id).to_not be nil
    end

  end
end
