FactoryBot.define do
  factory :order_form do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    zip_code { '123-4567' }
    area_id { Faker::Number.between(from: 2, to: 48) }
    city { '高山市東区' }
    address { '松川1-23-1' }
    build_name { '塩田ビル23' }
    phone_number { '09012345678' }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end