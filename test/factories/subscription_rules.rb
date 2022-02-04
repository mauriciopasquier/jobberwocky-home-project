FactoryBot.define do
  factory :subscription_rule do
    subscription

    trait :full do
      name { generate :unique_string }
      salary_min { generate :unique_number }
      salary_max { generate :unique_number }
      country { generate :unique_string }
    end
  end
end
