json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :contact1, :contact2, :email, :address1, :address2, :country, :state, :city, :zip_code
  json.url contact_url(contact, format: :json)
end
