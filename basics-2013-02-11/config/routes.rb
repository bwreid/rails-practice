Basics20130211::Application.routes.draw do

  get '/home' => 'home#homepage' # NOTHING ELSE! THE REST IS IN THE CONTROLLER.
  # EXECUTES THE homepage FUNCTION INSIDE OF CLASS home
  get '/about' => 'home#about'
  get '/faq' => 'home#faq'

  get '/dogs' => 'dogs#index' # INDEX JUST MEANS A LIST OF THINGS
  get '/dogs/new' => 'dogs#new'
  get '/dogs/faq' => 'dogs#faq'
  get '/dogs/faq2' => 'dogs#faq2'

  get '/auto/:color' => 'auto#color'
  get '/auto/:hp/:torque' => 'auto#engine'

  get '/calc/:x/:y/:operator' => 'calc#calculator'

  get '/funny' => 'funny#lol'

  root :to => 'home#homepage' # THIS REROUTES THE MAIN PAGE, IT'S YOUR '/'

end
