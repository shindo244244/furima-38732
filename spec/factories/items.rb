FactoryBot.define do
  factory :item do
    item_name          { 'テスト' }
    explain            { '説明' }
    category_id        { '2' }
    state_id           { '2' }
    delivery_charge_id { '2' }
    prefecture_id      { '2' }
    delivery_time_id   { '2' }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
