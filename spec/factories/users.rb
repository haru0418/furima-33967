FactoryBot.define do
  password = 'haru1234'
  factory :user do
    nickname { 'haru' }
    email { Faker::Internet.free_email }
    password { password }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birth_day { '1930-01-01' }
  end
end
