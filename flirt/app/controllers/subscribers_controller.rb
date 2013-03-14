class SubscribersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create( params[:user] )
    subscriber = Subscriber.create( tagline: 'change your tagline!', bio: 'change your bio!', gender: 'pick a gender', age: 999 )
    subscriber.user = @user
  end
end