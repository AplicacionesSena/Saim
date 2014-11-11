json.array!(@users) do |user|
  json.extract! user, :id, :nombre, :apellido, :email, :tipodoc_id, :documento, :cargo_id, :crypted_password, :salt
  json.url user_url(user, format: :json)
end
