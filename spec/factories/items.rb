FactoryBot.define do
  factory :item do
    association :user
    item_name {Faker::Name.name}
    item_detail {Faker::Lorem.sentence}
    item_category_id {Faker::Number.between(from:2,to:10)}
    item_condition_id {Faker::Number.between(from:2,to:6)}
    delivery_charge_id {Faker::Number.between(from:2,to:2)}
    prefecture_id {Faker::Number.between(from:2,to:47)}
    days_to_ship_id {Faker::Number.between(from:2,to:3)}
    price {Faker::Number.between(from: 300, to: 9_999_999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end


  end
end
