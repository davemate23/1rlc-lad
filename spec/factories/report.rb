FactoryGirl.define do
  factory :report do
    employee

    previous_date { Time.now - 3.days }
    next_date     { Time.now + 3.days }
  end
end
