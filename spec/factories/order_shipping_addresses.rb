FactoryBot.define do
  factory :order_shipping_address do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { 'テスト市' }
    address { 'テスト町1-1-1' }
    building { 'テストタワー' }
    phone { '09000000000' }
    association :user
    association :item
  end
end