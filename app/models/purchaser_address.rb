class PurchaserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  VALID_PHONE_NUMBER_REGEX = /\A\d{10}$|^\d{11}\z/

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :address
    validates :token
    validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGEX }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, region_id: region_id, city: city, address: address, building: building,
                           phone_number: phone_number, purchaser_id: purchaser.id)
  end
end
