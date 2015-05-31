FactoryGirl.define do
  factory :phone do
    employee

    sequence(:phone_type)   { |n| "type#{n}" }
    sequence(:name)   { |n| "name#{n}" }
    sequence(:number) { |n| "number#{n}" }
  end
end
