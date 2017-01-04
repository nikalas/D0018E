Rails.application.routes.draw do
  resources :ratings
  root 'frontend_pages#index'

  get '/product/:id', to: 'frontend_pages#product', as: 'item'
  get '/category/:id', to: 'frontend_pages#category', as: 'category'
  get '/user',    to: 'frontend_pages#user'
  post '/check_out' => 'deliveries#check_out', :as => 'check_out'
  get '/order/:id',   to: 'frontend_pages#order', as: 'order'
  get '/cart',    to: 'frontend_pages#customer_cart', as: 'basket'
  post '/add_to_cart/:product_id,:quantity' => 'carts#add_to_cart', :as => 'add_to_cart'
  post '/remove_from_cart/:product_id,:quantity' => 'carts#remove_from_cart', :as => 'remove_from_cart'
  post '/remove_all_from_cart/:product_id' => 'carts#remove_all_from_cart', :as => 'remove_all_from_cart'
  get '/sign_up', to: 'frontend_pages#sing_up'
  get '/login', to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/admin',   to: 'backend_pages#index'



  resources :sales_products
  resources :sales
  resources :products
  resources :categories
  resources :deliveries
  resources :carts
  resources :customers
  resources :product

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
