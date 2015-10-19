json.array!(@tables) do |table|
  json.extract! table, :id, :code, :capacity
  json.url table_url(table, format: :json)
end
