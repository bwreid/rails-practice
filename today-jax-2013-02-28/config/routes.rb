TodayJax20130228::Application.routes.draw do
  root :to => 'home#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources 'users', :except => [:edit] do
    collection do
      get 'edit'
    end
  end

  resources 'tasks'
  resources 'priorities', :only => [:index, :create, :update] do
    member do
      post :up
      post :down
    end
  end
end
