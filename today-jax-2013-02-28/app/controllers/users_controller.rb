class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to(@user)
    else
      render :new
    end
  end

  def show
    @user = @auth
  end

  def edit
    @user = @auth
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to(@user)
    else
      render :edit
    end
  end

end