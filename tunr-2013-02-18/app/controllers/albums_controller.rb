class AlbumsController < ApplicationController
  before_filter :check_if_admin_and_logged_in, :except => [:index, :show, :buy]

  def index
    @albums = Album.order(:name)
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to(albums_path)
    else
      render :new
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      redirect_to(albums_path)
    else
      render :edit
    end
  end

  def buy
    @album = Album.find( params[:id] )
    @auth.mixtapes << Mixtape.create( :name => "#{@album.name}" ) if !@auth.mixtapes.where( :name => "#{@album.name}" ).first

    @auth.balance -= @album.value(@auth)
    @auth.save

    @album.songs.each do |song|
      @auth.mixtapes.where( :name => "Library" ).first.songs << song if !@auth.has_song?(song)
      @auth.mixtapes.where( :name => "#{@album.name}" ).first.songs << song if @auth.mixtapes.where( :name => "#{@album.name}" ).first.songs.exclude?(song)
    end

    redirect_to(@auth.mixtapes.where( :name => "#{@album.name}" ).first)
  end

end
