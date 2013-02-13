ViewHelpers20130212::Application.routes.draw do
  get '/numbers' => 'home#numbers'
  get '/text' => 'home#text', :as => 'somethingnew' # THIS CHANGES THE PATH
  get '/assets' => 'home#assets'
  get '/url' => 'home#url'
  root :to => 'home#index'

end
