FactoryGirl.define do
  factory :medical_record do
    employee

    pstat    { rand(1 .. 50) }
    nato_cat { rand(1 .. 50) }
    sequence(:deployability) { |n| "deployability#{n}" }
    sequence(:blood_group)   { |n| "blood_group#{n}" }
    sequence(:notes)          { |n| "notes#{n}" }
  end
end
