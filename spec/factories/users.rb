FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password = "a1#{Faker::Internet.password(min_length: 4)}"
    # password = 'Fakertest'
    password                {password}
    password_confirmation   {password}
    family_name             {"山田"}
    first_name              {"花子"}
    family_name_kana        {"ヤマダ"}
    first_name_kana         {"ハナコ"}
    birth                   {"1990-01-01"}
  end
end