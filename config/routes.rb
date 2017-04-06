Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :orders, only: [:index, :show]
    resources :products
  end
  resources :orders, only: [:create]
  resources :line_items
  resources :products
  resource :users, only: [:new, :create]

  root controller: "products", action: "index" # TODO: change to a homepage of some kind
end
