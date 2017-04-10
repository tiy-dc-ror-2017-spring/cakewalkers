Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    get "/home", to: "home#index", as: "home"
    resources :orders, only: [:index, :show] do
      member do
        patch :claim
      end
      collection do
        get :ready
      end
    end
    resources :products
    resources :staff_members do
      resources :orders, only: [:index, :show], controller: :staff_members_orders
    end
  end
  resources :orders
  resources :line_items
  resources :products, only: [:index, :show]
  resource :users, only: [:new, :create]

  root controller: "products", action: "index" # TODO: change to a homepage of some kind
end
