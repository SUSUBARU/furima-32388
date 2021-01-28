FactoryBot.define do
  factory :user_item do
    postal_code       {"111-1111"}
    city              {Faker::Address.state}
    addresses      {Faker::Address.city}
    building_name     {Faker::Address.building_number}
    phone_number      {"11111111111"}
    prefecture_id     {Faker::Number.between(from: 2, to: 48)}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
