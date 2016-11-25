json.extract! product, :id, :name, :description, :picture, :category_id, :price, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)