FactoryGirl.define do
  factory :promotion_date do
    employee

    sequence(:substantive_rank) { |n| "rank#{n}" }
    sequence(:date)             { Time.now }
  end
end
