class SongsController < ApplicationController
  before_filter :check_if_admin_and_logged_in, :except => [:index, :show, :purchase, :buy, :refund]

  def index
    @songs = Song.order(:name)
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      redirect_to(songs_path)
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      redirect_to(@song.album)
    else
      render :edit
    end
  end

  def buy
    @song = Song.find(params[:id])
    if @auth.balance >= @song.price
      @song.update_attributes(params[:user])
      @auth.balance -= @song.price
      @auth.save
      @auth.mixtapes.where( :name => "Library" ).first.songs << @song
      redirect_to(@song.album)
    else
      flash[:errors] = 'Something went wrong. Please try again.'
      redirect_to(@song.album)
    end

  end

  def refund
    song = Song.find( params[:id] )
    @auth.balance += (song.price * 0.7)
    @auth.save
    @auth.mixtapes.each { |x| x.songs.delete(song) }
    redirect_to(@auth.mixtapes.where( :name => "Library" ).first)
  end

  private
  def check_if_logged_in
    redirect_to(root_path) if @auth.nil?
  end

end
