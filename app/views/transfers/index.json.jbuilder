json.array!(@transfers) do |transfer|
  json.extract! transfer, :id, :elemento_id, :cuentadante_id, :fechaTraspaso
  json.url transfer_url(transfer, format: :json)
end
