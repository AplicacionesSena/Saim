json.array!(@floors) do |floor|
  json.extract! floor, :id, :nombre
  json.url floor_url(floor, format: :json)
end
