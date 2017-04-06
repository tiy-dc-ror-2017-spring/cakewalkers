Rails.application.routes.draw do

  namespace :admin do
    resources :orders, only: [:index, :show]
  end

  resources :orders, only: [:create]

  resources :products

  resource :users, only: [:new, :create]

end
