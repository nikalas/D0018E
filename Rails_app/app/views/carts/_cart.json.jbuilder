json.extract! cart, :id, :products, :customer_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)