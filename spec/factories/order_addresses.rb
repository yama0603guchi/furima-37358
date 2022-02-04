FactoryBot.define do
  factory :order_address do
    post_code           {'123-4567'}
    postage_area_id     { 24 }
    municipalities      {'名古屋'}
    street_number       {'1-1'}
    building_name       {'名古屋ハイツ'}
    telephone_number    { 12345678912 }
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
