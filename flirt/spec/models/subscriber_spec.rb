# == Schema Information
#
# Table name: subscribers
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tagline         :string(255)
#  bio             :string(255)
#  preferences     :string(255)
#  age             :integer
#  gender          :string(255)
#  occupation      :string(255)
#  location        :string(255)
#  status          :string(255)
#  ethnicity       :string(255)
#  interests       :string(255)
#  income          :decimal(, )
#  subscription_id :integer
#  expires         :date
#

require 'spec_helper'

describe Subscriber do # TESTING OUT THIS CLASS

  describe '.new' do # TESTING OUT THIS CLASS METHOD
    it 'should create a new subscriber object' do
      subscriber = Subscriber.new
      expect(subscriber).to be_an_instance_of(Subscriber)
    end
  end

  describe '.create' do
    it 'has an id and was saved' do
      subscriber = Subscriber.create( :tagline => 'x', :gender => 'x', :bio => 'x', :age => 18 )
      expect(subscriber.id).to_not be nil
    end
  end

  it 'validates if tagline, gender, bio, and age are present and age is greater than 17' do
    subscriber = Subscriber.create( :age => 16 )
    expect(subscriber.id).to be nil
  end

  describe '#user' do
    it 'has a user' do
      subscriber = Subscriber.new
      user = User.new
      subscriber.user = user
      expect(subscriber.user).to be_an_instance_of(User)
    end
  end

  describe '#expiration' do
    let(:subscriber1) { Subscriber.create( tagline: 'change your tagline!', bio: 'change your bio!', gender: 'pick a gender', age: 999 ) }
    let(:scrip1) { Subscription.create }

    it 'has an expiration date' do
      subscriber1.expires = Date.current
      subscriber1.save
      expect(subscriber1.expires).to eq Date.current
    end
  end

  describe '#has_subscription?' do
    let(:user1) { User.create( username: 'x', email: 'x@y.com', password: 'x', password_confirmation: 'x' ) }
    let(:subscriber1) { Subscriber.create( tagline: 'change your tagline!', bio: 'change your bio!', gender: 'pick a gender', age: 999 ) }
    let(:scrip1) { Subscription.create }

    it 'should return the subscription object if it has a subscription' do
      subscriber1.subscription = scrip1
      subscriber1.save
      expect(subscriber1.has_subscription?).to be true
    end

    it 'returns FALSE if there is no subscription' do
      expect(subscriber1.has_subscription?).to be false
    end
  end

  describe '#metadata' do
    it 'has subscriber properties' do
      subscriber = Subscriber.new(
        tagline: 'x',
        bio: 'x',
        preferences: 'x, y',
        age: 25,
        gender: 'x',
        occupation: 'x',
        location: 'x',
        status: 'x',
        ethnicity: 'x',
        interests: 'a, b, c',
        income: 50_000 )
      expect(subscriber.tagline).to eq('x')
      expect(subscriber.bio).to eq('x')
      expect(subscriber.preferences).to eq('x, y')
      expect(subscriber.age).to eq(25)
      expect(subscriber.gender).to eq('x')
      expect(subscriber.occupation).to eq('x')
      expect(subscriber.location).to eq('x')
      expect(subscriber.status).to eq('x')
      expect(subscriber.ethnicity).to eq('x')
      expect(subscriber.interests).to eq('a, b, c')
      expect(subscriber.income).to eq(50_000)
    end
  end

end
