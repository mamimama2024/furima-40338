FactoryBot.define do
  factory :order_address do
    address = Gimei.address
    user_id       { Faker::Number.between(from: 1, to: 2147483647) }
    item_id       { Faker::Number.between(from: 1, to: 2147483647) }
    token         { "tok_abcdefghijk00000000000000000" }  
    postal_code   { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48)  }
    city          { address.city.to_s }
    addresses     { "1-2-3" }
    building      { "TECHビル" }
    phone_number  { Faker::Number.leading_zero_number(digits: 11) }
  end
end