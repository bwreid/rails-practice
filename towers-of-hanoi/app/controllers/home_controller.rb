class HomeController < ApplicationController
  def index
  end

  def make
    @blocks = params[:blocks].to_i
  end
end