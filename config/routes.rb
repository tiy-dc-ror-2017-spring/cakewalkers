Rails.application.routes.draw do

  resources :orders, only: [:create]

  resources :products

end