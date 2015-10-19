json.array!(@cuisines) do |cuisine|
  json.extract! cuisine, :id, :name, :cuisine_type, :description, :status
  json.url cuisine_url(cuisine, format: :json)
end
