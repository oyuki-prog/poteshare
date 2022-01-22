Rails.application.routes.draw do
  root :to => 'top#index'
  devise_for :users
  resources :rooms

  get '/reservations/new' => 'reservations#new'
  get '/reservations' => 'reservations#index'
  post '/reservations' => 'reservations#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
