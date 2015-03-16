json.array!(@traspasos) do |traspaso|
  json.extract! traspaso, :id, :elemento_id, :cuentadante_id, :fechaTrapaso
  json.url traspaso_url(traspaso, format: :json)
end
