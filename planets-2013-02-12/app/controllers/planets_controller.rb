class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def create
    # Planet.create(:name => params['name'], :image => params['image'], :orbit => params['orbit'].to_f, :mass => params['mass'].to_f, :diamater => params['diameter'].to_f, :moons => params['moons'] )
    # INSTEAD OF THIS, WRAP EVERYTHING IN THE FORM WITH planets[]
    Planet.create(params[:planet])
    redirect_to(planets_path)
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def destroy
    planet = Planet.find(params[:id])
    planet.delete
    redirect_to(planets_path)
  end

  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    planet = Planet.find(params[:id])
    planet.update_attributes(params[:planet]) # params(:planet) IS POINTING TO THE HASH WITH EVERYTHING INSIDE OF IT!
    redirect_to(planets_path)
  end

end