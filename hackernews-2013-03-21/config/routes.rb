Hackernews20130321::Application.routes.draw do
  root :to => 'stories#index'
  resources :stories, :only => [:index, :scrape] do
    collection do
      post :scrape
    end
  end
end
