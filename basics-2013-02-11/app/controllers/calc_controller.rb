class CalcController < ApplicationController
  def calculator
    @x = params['x'].to_i
    @y = params['y'].to_i

    @result = case params['operator']
    when '+' then @x + @y
    when '-' then @x - @y
    when '*' then @x * @y
    end
    # AT THE END, IT GOES AND FINDS THE HTML FILE
  end
end