Flirt::Application.routes.draw do
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :subscribers, :only => [:new, :create]
  resources :users, :only => [:new, :create]
  root :to => 'welcome#index'
end
