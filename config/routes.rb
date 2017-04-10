Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
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

  get "/checkout/address", controller: "checkout", action: "address_new", as: "address_checkout"
  post "/checkout/address", controller: "checkout", action: "address_create"
  get "/checkout/payment", controller: "checkout", action: "payment_new", as: "payment_checkout"
  post "/checkout/payment", controller: "checkout", action: "payment_create"
  get "/checkout/success", controller: "checkout", action: "order_payment_successful"
  root controller: "products", action: "index" # TODO: change to a homepage of some kind
end
