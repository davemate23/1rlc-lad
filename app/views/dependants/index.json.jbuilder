json.array!(@dependants) do |dependant|
  json.extract! dependant, :id, :first_name, :last_name, :date_of_birth, :gender, :relation, :anniversary, :employee_id
  json.url dependant_url(dependant, format: :json)
end
