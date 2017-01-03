json.extract! rating, :id, :product_id, :customer_id, :grade, :review, :created_at, :updated_at
json.url rating_url(rating, format: :json)