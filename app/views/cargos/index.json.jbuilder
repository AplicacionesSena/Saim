json.array!(@cargos) do |cargo|
  json.extract! cargo, :id, :nombre, :descripcion, :privilegioVer, :privilegioEditar, :privilegioEleminar, :privilegioCrear
  json.url cargo_url(cargo, format: :json)
end
