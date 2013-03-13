Flirt::Application.routes.draw do
  resources :subscribers, :only => [:new, :create]
  root :to => 'welcome#index'
end
