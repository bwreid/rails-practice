class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authentication

  private
  def authentication
    @auth = User.find(session[:user_id]) if session[:user_id]
  end

  def is_user
    flash[:notice] = 'You need to login.'
    redirect_to(root_path) unless session[:user_id]
  end

  def is_admin
    flash[:notice] = 'You do not have access to do that.'
    redirect_to(root_path) unless session[:user_id].present? && User.find(session[:user_id]).is_admin
  end
end
