class PaintingsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def create
    painting = Painting.create(params[:painting])
    redirect_to(painting)
  end

  def new
    @painting = Painting.new
  end

  def edit
    @painting = Painting.find(params['id'])
  end

  def show
    @painting = Painting.find(params['id'])
  end

  def update
    painting = Painting.find(params['id']) # THIS CAME FROM THE URL
    painting.update_attributes(params[:painting]) # THIS CAME FROM THE FORM
    redirect_to(painting)
  end

  def destroy
    painting = Painting.find(params['id'])
    painting.delete
    redirect_to(paintings_path)
  end
end
