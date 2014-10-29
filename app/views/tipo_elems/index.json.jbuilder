json.array!(@tipo_elems) do |tipo_elem|
  json.extract! tipo_elem, :id, :nombre, :descripcion
  json.url tipo_elem_url(tipo_elem, format: :json)
end
