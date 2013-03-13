class SessionController < ApplicationController
  before_filter :authentication

  def new
  end

  def create
    user = User.where( :username => params[:username] ).first
    if user.present? && user.authenticate( params[:password] )
      session[:user_id] = user.id
      redirect_to( user )
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to( login_path )
  end
end