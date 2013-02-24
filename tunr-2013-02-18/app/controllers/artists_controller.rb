class ArtistsController < ApplicationController
  before_filter :check_if_admin_and_logged_in, :except => [:index, :show]

  def index
    @artists = Artist.order(:name)
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(params[:artist])
    if @artist.save
      redirect_to(@artist)
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to(@artist)
    else
      render :edit
    end
  end

end
