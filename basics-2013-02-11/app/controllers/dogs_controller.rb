class DogsController < ApplicationController
  def index
    redirect_to('/') # THIS STOPS IT ALL AND ASKS THE BROWSER TO SEND A NEW GET BACK WITH '/'
    # HERE, THE URL ACTUALLY CHANGES
  end

  def new
    faq # THIS WILL CALL THE ACTUAL FUNCTION
    # HERE, THE URL DOES NOT CHANGE
  end

  def faq
    render 'home/faq' # THIS REROUTES YOU TO ANOTHER CONTROLLER AND ITS PAGE
  end

  def faq2
    render 'faq' # CHANGES DEFAULT TO RENDER FAQ, ABOVE FUNCTION
    # HOWEVER, IT WILL NOT CALL THE 'faq' FUNCTION! THIS IS JUST FINDING THE HTML PAGE
  end

end