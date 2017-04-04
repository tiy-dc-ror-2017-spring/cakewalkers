Rails.application.routes.draw do
  resources :orders, only: [:create]
  resources :line_items
end
