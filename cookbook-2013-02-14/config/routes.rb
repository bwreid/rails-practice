Cookbook20130214::Application.routes.draw do
  resources :ingredients
  resources :books
  resources :recipes
  # root :to => 'welcome#index'
end
