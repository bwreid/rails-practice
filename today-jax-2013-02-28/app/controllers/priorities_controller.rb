class PrioritiesController < ApplicationController
  def index
    @priorities = @auth.priorities.order(:level).reverse
  end

  def create
    priority = Priority.create(params[:priority])
    @auth.priorities << priority
    render :json => [priority] # TAKES THE OBJECT THAT IS CREATED AND TURNS INTO JSON
  end

  def update
    if params[:id].present?
      priority = Priority.find(params[:id])
      priority.update_attributes(params[:priority])
      render :json => [priority]
    end
  end

  def up
    list = @auth.priorities.order(:level).reverse
    render :json => priority.swap_higher
  end

  def down
    list = @auth.priorities.order(:level).reverse
    current_priority_index = list.index{ |x| x.id == params['id'].to_i }

    if current_priority_index == (list.length - 1)
      priority = Priority.find(params['id'])
      priority.level -= 1
      priority.save
    else
      new_level = list[(current_priority_index-1)].level # PULLS THE LEVEL FROM THE PREVIOUS ONE IN THE ARRAY, WHICH HAS A HIGHER LEVEL
      priority = Priority.find(params['id'])
      priority.level = new_level - 1
      priority.save
    end

    render :json => [priority]
  end
end