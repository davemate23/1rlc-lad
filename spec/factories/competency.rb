FactoryGirl.define do
  factory :competency do
    employee

    sequence(:name)  { |n| "name#{n}" }
    sequence(:competency_type)  { |n| "type#{n}" }
    sequence(:grade) { |n| "grade#{n}" }

    start_date { Time.now }
    end_date   { Time.now + 2.days }
  end
end
