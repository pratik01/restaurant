json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address1, :address2, :country, :state, :city, :zip_code, :description, :contact1, :contact2, :logo, :is_active, :resister_date
  json.url restaurant_url(restaurant, format: :json)
end
