json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :employee, :title, :body, :created_at, :updated_at
  json.url announcement_url(announcement, format: :json)
end
