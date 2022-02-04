FactoryBot.define do
  factory :job do
    name { generate :unique_string }

    trait :full do
      country { generate :unique_string }
      salary { generate :unique_number }
    end
  end
end
