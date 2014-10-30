json.array!(@cuentadantes) do |cuentadante|
  json.extract! cuentadante, :id, :nombre, :tipo_doc_id, :documento, :cantidad_elementos, :nombre_elementos, :valor_elementos
  json.url cuentadante_url(cuentadante, format: :json)
end
