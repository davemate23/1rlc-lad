json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :employee, :title, :body, :created_at, :updated_at
  json.url suggestion_url(suggestion, format: :json)
end
