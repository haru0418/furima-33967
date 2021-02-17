FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '555-5555' }
    prefecture_id { 2 }
    prefecture_city { '横浜市' }
    prefecture_block { '青山' }
    prefecture_buildin { '柳' }
    phone_number { 1_234_567_899 }
  end
end
