Rails.application.routes.draw do
  resources :sales_products
  resources :sales
  resources :products
  resources :categories
  resources :deliveries
  resources :carts
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
