FactoryGirl.define do
  factory :trade_career do
    employee

    sequence(:paab_result) { |n| "paab_result#{n}" }
  end
end
