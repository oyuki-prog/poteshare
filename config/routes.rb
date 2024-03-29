Rails.application.routes.draw do
  root :to => 'top#index'
  devise_for :users
  get '/rooms/posts' => 'rooms#posts', as: 'rooms_posts'
  resources :rooms

  get '/users/profile' => 'users#edit', as: 'users_profile'
  patch '/users/profile' => 'users#update'
  get '/reservations/new' => 'reservations#new'
  get '/reservations' => 'reservations#index'
  post '/reservations' => 'reservations#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
