class MountainsController < ApplicationController
  def index
    @mountain = Mountain.all
  end

  def new
  end

  def create
    Mountain.create(params[:mountain])
    redirect_to(root_path)
  end

  def destroy
    mountain = Mountain.find(params[:id])
    mountain.delete
    redirect_to(root_path)
  end

  def edit
    @mountain = Mountain.find(params[:id])
  end

  def update
    mountain = Mountain.find(params[:id])
    mountain.update_attributes(params[:mountain])
    redirect_to(root_path)
  end

  def show
    @mountain = Mountain.find(params[:id])
  end
end
