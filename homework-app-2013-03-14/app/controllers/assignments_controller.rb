class AssignmentsController < ApplicationController
  def index
  end

  def new
    @assignment = Assignment.new
  end

  def create
    assignment = Assignment.new( params[:assignment] )
    assignment.group_size = assignment.group_size.to_i
    assignment.students = Student.all.map(&:name).shuffle
    assignment.save
  end

  def show
    @assignment = Assignment.find( params[:id] )
  end
end