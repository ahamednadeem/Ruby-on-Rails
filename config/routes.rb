Rails.application.routes.draw do
  get 'sessions/new'

  resources :friends
  
  get 'home/about'
  root 'home#index'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  
  
  get 'search', to: "friends#search"
  get "up" => "rails/health#show", as: :rails_health_check

end
