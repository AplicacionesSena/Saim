json.array!(@floors) do |floor|
  json.extract! floor, :id, :nombre, :cuentadante_id
  json.url floor_url(floor, format: :json)
end
