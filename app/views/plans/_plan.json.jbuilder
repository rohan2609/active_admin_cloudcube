json.extract! plan, :id, :plan_name, :plan_price, :plan_rent, :no_of_days, :speed, :created_at, :updated_at
json.url plan_url(plan, format: :json)
