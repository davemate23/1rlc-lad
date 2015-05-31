FactoryGirl.define do
  factory :spouse do
    employee

    date_of_birth { Time.now - 18.years }
    sequence(:first_name) { |n| "first_name#{n}" }
    sequence(:last_name)  { |n| "last_name#{n}" }
    sequence(:gender)     { |n| "gender#{n}" }
    sequence(:type)       { |n| "type#{n}" }
  end
end
