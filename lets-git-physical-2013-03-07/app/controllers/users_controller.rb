class UsersController < ApplicationController
  before_filter :is_user, :only => [:edit, :show, :update]
  def index
    @users = User.order(:username)
  end

  def show
    @user = @auth
  end

  def new
    @user = User.new
  end

  def create
    user = User.new( params[:user] )
    @users = User.order( :username )

    respond_to do |format|
      if user.save
        format.html { redirect_to user, notice: 'User was successfully created.' }
        format.js
      else
        render :new
      end
    end

  end

  def edit
    @user = User.find( params[:id] )
  end

  def update
    user = User.find( params[:id] )
    @users = User.order(:username)

    respond_to do |format|
      if user.update_attributes( params[:user] )
        format.html { redirect_to( user ) }
        format.js
      else
        render :edit
      end
    end

  end
end