Rails.application.routes.draw do
  get 'frontend_pages/index'

  get 'frontend_pages/product'

  get 'frontend_pages/user'

  get 'frontend_pages/order'

  get 'frontend_pages/customer_cart'

  get 'frontend_pages/sing_up'

  get 'frontend_pages/sign_in'

  get 'backend_pages/index'

  resources :sales_products
  resources :sales
  resources :products
  resources :categories
  resources :deliveries
  resources :carts
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
