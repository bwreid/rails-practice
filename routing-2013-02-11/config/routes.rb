Routing20130211::Application.routes.draw do
  get '/start' => 'start#start'
  get '/start/a' => 'start#a'
  get '/start/b' => 'start#b'

  get '/:option' => 'start#option'

  root :to => 'start#start'
end
