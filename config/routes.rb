Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'new/create'

  get 'new/destroy'

  resource :users, only: [:new, :create]
  resources :products
end
