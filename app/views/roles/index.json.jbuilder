json.array!(@roles) do |role|
  json.extract! role, :id, :PID, :description
  json.url role_url(role, format: :json)
end
