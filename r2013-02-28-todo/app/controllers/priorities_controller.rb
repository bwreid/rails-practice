class PrioritiesController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @priorities = @auth.priorities
  end

  def up
    priority = Priority.find(params[:id])
    render :json => priority.swap_up
  end

  def down
    priority = Priority.find(params[:id])
    render :json => priority.swap_down
  end

  def create
    priority = Priority.create(params[:priority])
    @auth.priorities << priority
    render :json => [priority]
  end

  def update
    priority = Priority.find(params[:id])
    priority.update_attributes(params[:priority])
    render :json => [priority]
  end
end
