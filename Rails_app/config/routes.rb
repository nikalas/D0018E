Rails.application.routes.draw do
  root 'frontend_pages#index'

  get '/product/:id', to: 'frontend_pages#product', as: 'item'
  get '/user',    to: 'frontend_pages#user'
  get '/order',   to: 'frontend_pages#order'
  get '/cart',    to: 'frontend_pages#customer_cart'
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