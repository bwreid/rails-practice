Flirt::Application.routes.draw do
  get '/login' => 'session#new'
  post '/login' => 'session#create'

  resources :subscribers, :only => [:new, :create]
  resources :users, :only => [:new, :create]
  root :to => 'welcome#index'
end
