json.array!(@reintegros) do |reintegro|
  json.extract! reintegro, :id, :elemento_id, :cuentadante_id, :fechaReintegro
  json.url reintegro_url(reintegro, format: :json)
end
