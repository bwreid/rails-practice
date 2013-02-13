StockMovie20130211::Application.routes.draw do
  get '/home' => 'home#index'
  get '/about' => 'home#about'
  get '/faq' => 'home#faq'

  get '/movie' => 'movie#index'
  post '/movie/find' => 'movie#find'
  get '/movie/info' => 'movie#info'

  get '/stock' => 'stock#index'
  post '/stock/find' => 'stock#find'
  get '/stock/info' => 'stock#info'

  root :to => 'home#index'
end
