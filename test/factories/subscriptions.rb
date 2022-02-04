FactoryBot.define do
  factory :subscription do
    email { generate :unique_email }
  end
end
