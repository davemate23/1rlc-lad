FactoryGirl.define do
  factory :role do
    sequence(:description) { |n| "description#{n}" }
    sequence(:pid)         { |n| "pid#{n}" }
  end
end
