class StartController < ApplicationController

  def start
  end

  def a
  end

  def b
  end

  def option
    @num = params['number']
    case @num
    when "a" then redirect_to '/start/a'
    when "b" then redirect_to '/start/b'
    when "1" then redirect_to '/1'
    end
  end

  def number

  end

end