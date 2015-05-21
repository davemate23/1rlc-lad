FactoryGirl.define do
  factory :employee do
    sequence(:email)             { |n| "some_mail#{n}@mail.com" }
    sequence(:last_name)         { |n| "last_name#{n}" }
    sequence(:password)          { |n| "password#{n}" }
    sequence(:substantive_rank)  { |n| "Some rank#{n}" }
    date_of_birth                { Time.now - rand(1 .. 50).years }
    service_no                   { rand(1 .. 50) }
    gender                       { ['male', 'famale'].sample }
    service_start_date           { Time.now }

    trait :admin do
      admin true
    end
  end
end
