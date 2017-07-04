json.extract! customer, :id, :fullname, :contact, :email, :access_token, :customer, :date, :status, :address, :pincode, :created_at, :updated_at
json.url customer_url(customer, format: :json)
