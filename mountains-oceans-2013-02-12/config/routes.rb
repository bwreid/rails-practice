MountainsOceans20130212::Application.routes.draw do
  get '/mountain' => 'mountains#index'

  get '/mountain/new' => 'mountains#new'
  post '/mountain/new' => 'mountains#create'

  get '/mountain/:id' => 'mountains#show', :as => 'mountain_show'

  get '/mountain/:id/edit' => 'mountains#edit', :as => 'mountain_edit'
  post '/mountain/:id' => 'mountains#update', :as => 'mountain_update'

  post '/mountain/:id/delete' => 'mountains#destroy', :as => 'mountain_delete'

  root :to => 'mountains#index'
end
