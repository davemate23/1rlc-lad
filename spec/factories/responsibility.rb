FactoryGirl.define do
  factory :responsibility do
    employee

    sequence(:name)        { |n| "name#{n}" }
    sequence(:description) { |n| "description#{n}" }
  end
end
