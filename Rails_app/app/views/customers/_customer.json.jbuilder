json.extract! customer, :id, :name, :p_nr, :adress, :zip, :city, :email, :phone_nr, :password, :picture, :created_at, :updated_at
json.url customer_url(customer, format: :json)