json.array!(@restaurant_features) do |restaurant_feature|
  json.extract! restaurant_feature, :id, :name, :description
  json.url restaurant_feature_url(restaurant_feature, format: :json)
end
