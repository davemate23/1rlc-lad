FactoryGirl.define do
  factory :qualification do
    employee

    end_date { Time.now + 3.days }

    sequence(:title)  { |n| "title#{n}" }
    sequence(:grade)  { |n| "grade#{n}" }
    sequence(:status) { |n| "status#{n}" }
    sequence(:school) { |n| "school#{n}" }
  end
end
