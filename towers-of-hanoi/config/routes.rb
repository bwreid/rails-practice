TowersOfHanoi::Application.routes.draw do
  root :to => 'home#index'
  post '/make' => 'home#make'
end
