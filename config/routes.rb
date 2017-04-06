Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :orders, only: [:create]

  resources :products

  resource :users, only: [:new, :create]
end
