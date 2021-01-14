FactoryBot.define do
  factory :item do
    name              {Faker::Name.initials(number: 2)}
    explain           {Faker::Name.initials(number: 2)}
    category_id       {Faker::Number.number(digits: 1)}
    state_id          {Faker::Number.number(digits: 1)}
    burden_id         {Faker::Number.number(digits: 1)}
    prefecture_id     {Faker::Number.number(digits: 1)}
    delivery_date_id  {Faker::Number.number(digits: 1)}
    price             {Faker::Number.between(from: 300, to: 9999999)}
  end
end
