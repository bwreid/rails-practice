Books201302013::Application.routes.draw do
  resources :books
  resources :authors
  root :to => 'authors#index'
end
