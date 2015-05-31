FactoryGirl.define do
  factory :note do
    employee

    date { Time.now - 3.days }
    sequence(:comment) { |n| "last_name#{n}" }
  end
end
