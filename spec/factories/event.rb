FactoryGirl.define do
  factory :event do
    employee

    sequence(:event_type) { |n| "type#{n}" }
    sequence(:name) { |n| "name#{n}" }
    start_date { Time.now }
    end_date   { Time.now + 2.days }
  end
end
