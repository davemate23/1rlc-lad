json.array!(@competencies) do |competency|
  json.extract! competency, :id, :name, :competency_type, :grade, :start_date, :end_date
  json.url competency_url(competency, format: :json)
end
