FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_image.jpg'), 'image/jpeg') }
    name {Faker::Lorem.unique.word}
    description {Faker::Lorem.unique.paragraph}
    category_id { 2 }
    condition_id { 2 }
    delivery_charge_id { 2 }
    region_id { 2 }
    shipping_days_id { 2 }
    price { Faker::Number.between(from: 300, to: 999_999) }
    association :user
  end
end
