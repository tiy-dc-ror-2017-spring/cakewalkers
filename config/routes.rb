Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :orders, only: [:create]

  resources :products

  resource :users, only: [:new, :create]

end
