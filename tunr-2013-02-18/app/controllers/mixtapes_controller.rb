class MixtapesController < ApplicationController
  before_filter :check_if_logged_in

  def new
    @mixtape = Mixtape.new
  end

  def edit
    @mixtape = Mixtape.find(params[:id])
  end

  def create
    @mixtape = Mixtape.new( params[:mixtape] )
    @mixtape[:name] = "Library Copy" if @mixtape[:name] == 'Library'
    if @mixtape.save
      @auth.mixtapes << @mixtape
      redirect_to(@mixtape)
    else
      render :new
    end

  end

  def update
    @mixtape = Mixtape.find( params[:id] )
    if @mixtape.update_attributes( params[:mixtape] )
      redirect_to(@mixtape)
    else
      render :edit
    end
  end

  def destroy
    mixtape = Mixtape.find( params[:id] )
    mixtape.delete
    redirect_to( @auth.mixtapes.where( :name => "Library").first )
  end

  def show
    @mixtape = Mixtape.find(params[:id])
  end

  private
  def check_if_logged_in
    redirect_to(root_path) if @auth.nil?
  end

end