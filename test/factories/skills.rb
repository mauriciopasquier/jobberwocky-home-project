FactoryBot.define do
  factory :skill do
    name { generate :unique_string }
  end
end
