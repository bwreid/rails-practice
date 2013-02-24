Pinterest20130215::Application.routes.draw do
  resources :users do
    collection do
      post 'sendtxt'
    end
  end

  root :to => 'users#index'
  # get '/pinterest' => 'pinterest#show'
end
