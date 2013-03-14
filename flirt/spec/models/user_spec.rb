# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  userable_id     :integer
#  userable_type   :string(255)
#

require 'spec_helper'

describe User do # TESTING OUT THIS CLASS
  describe '.new' do # TESTING OUT THIS CLASS METHOD

    it 'should create a new user object' do
      user = User.new
      expect(user).to be_an_instance_of(User)
    end

    it 'has username, email, password, and password confirmation' do
      user = User.new( username: 'x', email: 'x@y.com', password: 'x', password_confirmation: 'x' )
      expect(user.username).to eq('x')
      expect(user.email).to eq('x@y.com')
      expect(user.password).to eq('x')
      expect(user.password_confirmation).to eq('x')
    end
  end

  describe '.create' do

    it 'has an id and was saved' do
      user = User.create( username: 'x', email: 'x@y.com', password: 'x', password_confirmation: 'x' )
      expect(user.id).to_not be nil
    end

    it 'fails validation if username or email is blank while supplying password' do
      user = User.create( :password => 'x', :password_confirmation => 'x' )
      expect(user.id).to be nil
    end

  end
end
