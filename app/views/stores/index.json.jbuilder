json.array!(@stores) do |store|
  json.extract! store, :id, :plantname, :height, :price, :description, :type
  json.url store_url(store, format: :json)
end
