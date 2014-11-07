json.array!(@traspasos) do |traspaso|
  json.extract! traspaso, :id, :elemento_id, :cuentadanteDestino, :fechaTraspaso
  json.url traspaso_url(traspaso, format: :json)
end
