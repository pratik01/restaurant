json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :email, :contact1, :contact2, :address1, :address2, :country, :state, :city, :zip_code
  json.url customer_url(customer, format: :json)
end
