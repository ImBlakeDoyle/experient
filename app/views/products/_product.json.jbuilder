json.extract! product, :id, :name, :cost, :location, :description, :active, :category, :keywords, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
