FactoryBot.define do
  factory :item do
    association :user

    item_name { Faker::Name.name }
    explane { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    item_state_id { Faker::Number.between(from: 2, to: 7) }
    charge_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    deliver_day_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }
  end
end
