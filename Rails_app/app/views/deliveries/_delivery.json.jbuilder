json.extract! delivery, :id, :customer_id, :cart_id, :adress, :zip, :city, :payed, :shipped, :order_date, :created_at, :updated_at
json.url delivery_url(delivery, format: :json)