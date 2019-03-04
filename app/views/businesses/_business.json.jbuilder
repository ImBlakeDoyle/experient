json.extract! business, :id, :trading_name, :registered_business_name, :business_address, :post_code, :abn, :phone_number, :created_at, :updated_at
json.url business_url(business, format: :json)
