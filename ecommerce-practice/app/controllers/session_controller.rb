class SessionController < ApplicationController
  def new
  end

  def create
    user = User.where( email: params[:email] ).first
    if user && user.authenticate( params[:password] )
      session[:user_id] = user.id
      Notifications.login_message(user).deliver
      @auth = user
    end
    @products = Product.all
  end

  def destroy
    session[:user_id] = nil
    @auth = nil
  end
end
