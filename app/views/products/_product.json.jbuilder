json.extract! product, :id, :name, :description, :image, :price, :expire, :store_id, :created_at, :updated_at
json.url product_url(product, format: :json)
