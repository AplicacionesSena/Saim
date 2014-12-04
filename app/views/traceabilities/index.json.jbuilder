json.array!(@traceabilities) do |traceability|
  json.extract! traceability, :id, :cuentadantes_id, :elementos_id, :events_id, :reintegros_id, :traspasos_id, :users_id
  json.url traceability_url(traceability, format: :json)
end
