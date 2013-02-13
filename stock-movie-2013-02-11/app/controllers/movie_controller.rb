class MovieController < ApplicationController
  def index
  end

  def info
  end

  def find
    @movie = params['movie'].gsub(' ','+')
    @movie_hash = JSON(HTTParty.get("http://www.omdbapi.com/?t=#{@movie}"))
    render '/movie/info'
  end

end