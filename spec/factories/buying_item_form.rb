FactoryBot.define do
  factory :buying_item_form do
   user_id{1}
   item_id{1}
   post_number{Faker::Number.decimal_part(digits:3) + "-" +Faker::Number.decimal_part(digits:4)}
   prefecture{Faker::Number.between(from:1,to:47)}
   town{Faker::Address.city}
   address{Faker::Address.street_address}
   building{Faker::Address.street_address}
   telephone{Faker::Number.decimal_part(digits:11)}
   token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end

 