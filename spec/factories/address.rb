FactoryGirl.define do
  factory :address do
    employee

    sequence(:address_type)            { |n| "type#{n}" }
    sequence(:street_address)  { |n| "street_address#{n}" }
    sequence(:street_address_2) { |n| "street_address2#{n}" }
    sequence(:town)            { |n| "town#{n}" }
    sequence(:county)          { |n| "county#{n}" }
    sequence(:country)         { |n| "country#{n}" }
    sequence(:post_code)       { |n| "post#{n}" }
  end
end
