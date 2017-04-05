Rails.application.routes.draw do
  resource :users, only: [:new, :create]
  resources :products
end
