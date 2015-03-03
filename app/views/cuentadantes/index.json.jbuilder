json.array!(@cuentadantes) do |cuentadante|
  json.extract! cuentadante, :id, :nombre, :tipo_doc_id, :documento
  json.url cuentadante_url(cuentadante, format: :json)
end
