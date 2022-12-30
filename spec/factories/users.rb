FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 8, mix_case: false)}
    password_confirmation {password}
    family_name           {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    family_name_kana      {gimei.last.katakana}
    first_name_kana       {gimei.first.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end