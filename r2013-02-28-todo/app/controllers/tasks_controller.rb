class TasksController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @auth.tasks.each do |task|
      if task.is_complete
        task.priority = Priority.where( :value => 0 ).first
        task.save
      end
    end

    @tasks = @auth.tasks.joins(:priority).order('priorities.value DESC').order('tasks.title ASC')
  end

  def create
    # binding.pry
    task = Task.create(params[:task])
    @auth.tasks << task
    render :json => [task.as_json(:include => :priority)]
  end

  def update
    task = Task.find(params[:id])
    task.update_attributes(params[:task])
    render :json => [task.as_json(:include => :priority)]
  end

  def complete
    task = Task.find(params[:id])
    # binding.pry
    if task.is_complete == true
      task.is_complete = false
      task.priority = @auth.priorities.last
      task.save
    else
      task.is_complete = true
      task.priority = Priority.where( :value => 0 ).first
      task.save
    end

    render :json => [task.as_json(:include => :priority)]
  end

  def destroy
    task = Task.find(params[:id])
    task.delete
    render :nothing => true
  end

end

# u.tasks.joins(:priority).order('priorities.value DESC').order('tasks.title ASC')
