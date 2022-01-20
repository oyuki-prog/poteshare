Rails.application.routes.draw do
  root :to => 'top#index'
  devise_for :users
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
