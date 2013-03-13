LetsGitPhysical20130307::Application.routes.draw do
  root :to => 'users#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, :except => [:destroy]
  resources :exercises do
    member do
      get :chart
    end
  end

end
