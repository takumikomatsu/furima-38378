FactoryBot.define do
  factory :item do
    name               { 'test' }
    category_id        { 2 }
    price              { 30_000 }
    description        { 'test' }
    status_id          { 2 }
    region_id          { 2 }
    shipping_date_id   { 2 }
    shipping_charge_id { 2 }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
