Planets20130212::Application.routes.draw do
  get '/planets' => 'planets#index'
  get '/planets/new' => 'planets#new' # NEW IS FOR WHEN YOU'RE SHOWING A FORM FOR SOMETHING

  post '/planets' => 'planets#create' # USE CREATE WHEN YOU'RE MAKING A BRAND NEW SOMETHING OR OTHER

  get '/planets/:id' => 'planets#show', :as => 'planet' # show IS USED TO SHOW ONE PARTICULAR THING
  post '/planets/:id' => 'planets#update', :as => 'update'
  post '/planets/:id/delete' => 'planets#destroy', :as => 'planet_delete'
  get '/planets/:id/edit' => 'planets#edit', :as => 'planet_edit'

  root :to => 'planets#index'
end
