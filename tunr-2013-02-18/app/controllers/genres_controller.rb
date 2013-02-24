class GenresController < ApplicationController
  before_filter :check_if_admin_and_logged_in, :except => [:index, :show]

  def index
    @genres = Genre.order(:name)
  end

  def new
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      redirect_to(genres_path)
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      redirect_to(genres_path)
    else
      render :edit
    end
  end

end