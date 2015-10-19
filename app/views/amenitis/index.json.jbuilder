json.array!(@amenitis) do |ameniti|
  json.extract! ameniti, :id
  json.url ameniti_url(ameniti, format: :json)
end
