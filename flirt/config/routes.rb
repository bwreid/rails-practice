Flirt::Application.routes.draw do
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :subscribers, :except => [:index, :destroy] do
    collection do
      post :purchase
    end
  end

  resources :users, :only => [:new, :create]
  root :to => 'welcome#index'
end
