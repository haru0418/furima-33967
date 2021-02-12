FactoryBot.define do
  factory :item do
    product { 'テスト' }
    product_description { 'テストテスト' }
    category_id { 2 }
    product_condition_id { 2 }
    ship_burden_id { 2 }
    prefecture_id { 2 }
    ship_day_id { 2 }
    price { 33967 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
