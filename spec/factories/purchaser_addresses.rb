FactoryBot.define do
  factory :purchaser_address do
    postal_code { '123-4567' }
    prefecture_id { '2' }
    city { 'テスト' }
    address { '1-1-1' }
    building { 'テストビル' }
    phone_number { '09012345678' }
    token { 'process.env.PAYJP_PUBLIC_KEY'}
  end
end
