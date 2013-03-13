class ExercisesController < ApplicationController
  before_filter :is_user

  def index
    @exercises = @auth.exercises.order(:activity)
  end

  def new
    @exercise = Exercise.new
  end

  def create
    exercise = Exercise.new( params[:exercise] )
    @exercises = Exercise.order( :activity )
    respond_to do |format|
      if exercise.save
        @auth.exercises << exercise
        format.html { redirect_to( exercises_path ) }
        format.json
      else
        render :new
      end
    end
  end

  def edit
    @exercise = Exercise.find( params[:id] )
  end

  def update
    @exercise = Exercise.find( params[:id] )

    if exercise.update_attributes( params[:exercise] )
      redirect_to( exercises_path )
    else
      render :edit
    end

  end

  def show
    @exercise = Exercise.find( params[:id] )
  end

  def destroy
    exercise = Exercise.find( params[:id] )
    exercise.delete
    redirect_to( exercises_path )
  end

  def chart
    val = @auth.exercises.where( :activity => Exercise.find(params[:id]).activity )
    render :json => val
  end
end
