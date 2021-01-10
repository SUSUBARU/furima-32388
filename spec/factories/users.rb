FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password          {"test2222"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_reading     {"タナカ"}
    first_name_reading    {"タロウ"}
    birthday              {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end