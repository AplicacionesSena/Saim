json.array!(@elementos) do |elemento|
  json.extract! elemento, :id, :placa, :tipo_elem_id, :nombre, :descripcion, :modelo, :serial, :fecha_adquisicion, :valor, :estado, :cuentadante_id
  json.url elemento_url(elemento, format: :json)
end
