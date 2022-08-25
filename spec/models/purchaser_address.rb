require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchaser_address = FactoryBot.build(:purchaser_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '入力情報に問題がない場合' do
    it '全ての値が入力されていれば登録できる' do
      expect(@purchaser_address).to be_valid
    end
    it 'buildingが入力されていなくても登録できる' do
      @purchaser_address.building = ''
      expect(@purchaser_address).to be_valid
    end
  end
  context '入力情報に問題がある場合' do
    it 'postal_codeが空だと登録できない' do
      @purchaser_address.postal_code = ''
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと登録できない' do
      @purchaser_address.postal_code = '1234567'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'region_idが0だと登録できない' do
      @purchaser_address.region_id = 0
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Region can't be blank")
    end
    it 'cityが空だと登録できない' do
      @purchaser_address.city = ''
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと登録できない' do
      @purchaser_address.address = ''
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと登録できない' do
      @purchaser_address.phone_number = ''
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが11桁より大きいと登録できない' do
      @purchaser_address.phone_number = '123456789012'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが10桁より少ないと登録できない' do
      @purchaser_address.phone_number = '123456789'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが全角だと登録できない' do
      @purchaser_address.phone_number = '１２３４５６７８９０'
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'tokenが空だと登録できない' do
      @purchaser_address.token = ''
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'userが紐づいていないと登録できない' do
      @purchaser_address.user_id = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと登録できない' do
      @purchaser_address.item_id = nil
      @purchaser_address.valid?
      expect(@purchaser_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
