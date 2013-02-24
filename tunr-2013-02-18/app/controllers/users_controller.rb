class UsersController < ApplicationController
  before_filter :check_if_logged_in, :except => [:new, :create]
  before_filter :check_if_admin_and_logged_in, :only => [:index, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      @user.mixtapes << Mixtape.new( :name => "Library" )
      redirect_to(root_path)
    else
      render :new
    end
  end

  # LOGGED IN ONLY

  def edit
    @user = @auth
  end

  def update
    @user = @auth
    if @user.update_attributes(params[:user])
      redirect_to(root_path)
    else
      render :edit
    end
  end

  # ADMIN ONLY

  def index
    @users = User.order(:name)
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to(users_path)
  end

  private
  def check_if_logged_in
    redirect_to(root_path) if @auth.nil?
  end

  def check_if_admin
    redirect_to(root_path) if @auth.nil? || !@auth.is_admin # ORDER IS NOT GUARANTEED, SO DO BOTH
  end

end
