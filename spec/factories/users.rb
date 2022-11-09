FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太朗'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2022-12-31')}
  end
end