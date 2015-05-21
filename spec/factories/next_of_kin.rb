FactoryGirl.define do
  factory :next_of_kin do
    employee

    sequence(:first_name)     { |n| "first_name#{n}" }
    sequence(:last_name)      { |n| "last_name#{n}" }
    sequence(:address)        { |n| "address#{n}" }
    sequence(:contact_number) { |n| "contact_number#{n}" }
    sequence(:relation)       { |n| "relation#{n}" }
  end
end
