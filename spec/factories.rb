FactoryBot.define do
  factory :restaurant do
    name { Faker::Name.name_with_middle }
    address { Faker::Address.street_name }
  end
end