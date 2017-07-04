json.extract! offline_payment, :id, :customer_id, :plan_id, :amount, :date, :check_number, :bank_name, :date_on_check, :created_at, :updated_at
json.url offline_payment_url(offline_payment, format: :json)
