class HomeController < ApplicationController
  def index
  end

  def assets
    @img_url = 'http://www.my2fun.com/wp-content/uploads/2012/11/Friday-Funny-Animal-Pics-1.jpeg'
  end

  def numbers
    @amount = 400.333333
    @large_number = 22000111945503322
    @phone = 2124445555
    @comma = 21133311
  end

  def text
    @cycle = (1..20).to_a
    @person = 5
    @fellows = 1
    @story = "a very long long time ago in a place far far away"
  end

  def url
    @url = 'http://bryanwreid.com'
  end
end