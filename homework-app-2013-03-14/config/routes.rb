HomeworkApp20130314::Application.routes.draw do
  root :to => 'home#index'
  resources :students, :only => [:new, :create, :index]
  resources :assignments, :only => [:new, :create, :show, :index]
end
