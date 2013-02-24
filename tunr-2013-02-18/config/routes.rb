Tunr20130218::Application.routes.draw do
  root :to => 'home#index'
  get '/query' => 'home#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :artists
  resources :albums do
    member do
      post 'buy'
    end
  end
  resources :genres
  resources :mixtapes, :except => [:index]
  resources :songs do
    member do
      delete 'refund'
      post 'buy'
    end
  end

  resources 'users', :except => [:edit] do
    collection do
      get 'edit' # THIS ADDS A NEW ROUTE AT /users/edit THAT CONTAINS NO ID PARAM
    end
  end

end