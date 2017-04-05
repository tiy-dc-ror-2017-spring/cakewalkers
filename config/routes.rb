Rails.application.routes.draw do

  resources :orders, only: [:create]

  resources :products

  resource :users, only: [:new, :create]

end
