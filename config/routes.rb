Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :orders, only: [:create]

  resources :products

  resource :users, only: [:new, :create]

  root controller: "products", action: "index" # TODO: change to a homepage of some kind
end
