# Helper methods for all factories.
FactoryBot.define do
  sequence :unique_string, 'a'
  sequence :unique_number, 1
  sequence(:unique_email) do |n|
    "email-#{n}@example.com"
  end
end
