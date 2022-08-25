FactoryBot.define do
  factory :purchaser_address do
    postal_code  { '111-1111' }
    region_id    { 15 }
    city         { '横浜市青葉区' }
    address      { 'すすき野2-5-19' }
    building     { 'test' }
    phone_number { 11_111_111_111 }
    token        { '123test' }
  end
end
