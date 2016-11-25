json.extract! sale, :id, :start_date, :end_date, :picture, :created_at, :updated_at
json.url sale_url(sale, format: :json)