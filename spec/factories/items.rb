FactoryBot.define do
  factory :item do
    name             { "aaa" }
    info             { "aaa" }
    category_id      { 1 }
    status_id        { 1 }
    fee_id           { 1 }
    place_id         { 1 }
    day_id           { 1 }
    price            { 1000 }
    association :user

   after(:build) do |pic|
    pic.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
   end
  end
end