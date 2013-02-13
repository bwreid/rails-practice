# THIS IS THE CLASS THAT MANAGES THE homepage FUNCTION

class HomeController < ApplicationController
  # ADD Controller TO BE CLEAR
  # THIS WILL INHERIT EVERYTHING FROM ApplicationController
  def homepage # THIS IS CALLED AN ACTION WITHIN RAILS
    # IF YOU DID NOTHING IN HERE, THE CONVENTION IS IT WOULD GO TO
    # views > home > homepage.html.erb
    # YOU COULD RELY ON THIS SO YOU CAN JUST RELY ON CONVENTION, NOT CONFIGURATION
  end

  def about
  end

  def faq
  end
end