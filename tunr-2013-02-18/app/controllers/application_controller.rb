class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authentication

  private
  def authentication
    @auth = User.find( session[:user_id] ) if session[:user_id].present?
  end

  def check_if_admin_and_logged_in
    redirect_to(root_path) if (@auth.nil? || !@auth.is_admin) # ORDER IS NOT GUARANTEED, SO DO BOTH
  end

end
