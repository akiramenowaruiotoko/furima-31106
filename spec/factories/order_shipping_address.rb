FactoryBot.define do
  factory :order_shipping_address do
    user_id { 1 }
    item_id { 1 }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '札幌' }
    addresses { '函館1-3' }
    building { '小樽５０１' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
