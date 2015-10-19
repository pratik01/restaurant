json.array!(@banquet_halls) do |banquet_hall|
  json.extract! banquet_hall, :id, :capacity_of_guest, :category, :price, :description
  json.url banquet_hall_url(banquet_hall, format: :json)
end
