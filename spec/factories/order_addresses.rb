FactoryBot.define do
  factory :order_address do
    post_number       { '123-4567' }
    place_id          { 27 }
    city              { '大阪市' }
    street            { '中央区' }
    building          { 'マンション' }
    tell_number       { '09012345678' }
    token             { 'aaa' }
    user_id           { 1 }
    item_id           { 1 }
  end
end
