Rails.application.routes.draw do
  resources :orders, only: [:create]
  resources :line_items
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :users, only: [:new, :create]

end
