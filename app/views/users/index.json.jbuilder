json.array!(@users) do |user|
  json.extract! user, :id, :uuid, :uname, :password, :email, :salt, :is_admin
  json.url user_url(user, format: :json)
end
