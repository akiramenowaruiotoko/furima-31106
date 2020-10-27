FactoryBot.define do
  factory :item do
    image                  { Faker::Lorem.sentence }
    name                   { Faker::Lorem.sentence }
    info                   { Faker::Lorem.sentence }
    price                  { Faker::Number.between(from: 300, to: 9_999_999) }

    category_id            { 2 }
    sales_status_id        { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id          { 2 }
    scheduled_delivery_id  { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
