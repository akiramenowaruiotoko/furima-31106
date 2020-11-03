require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    @order_shipping_address = FactoryBot.build(:order_shipping_address)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'postal_code, prefecture_id, city, addresses, phone_number, tokenが存在すれば商品購入できる' do
        expect(@order_shipping_address).to be_valid
      end
      it 'buildingが存在しなくても商品購入ができる' do
        @order_shipping_address.building = nil
        expect(@order_shipping_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが存在しないと購入できない' do
        @order_shipping_address.postal_code = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが存在しないと購入できない' do
        @order_shipping_address.postal_code = "1234567"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが存在しないと購入できない' do
        @order_shipping_address.prefecture_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと購入できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが存在しないと購入できない' do
        @order_shipping_address.city = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが存在しないと購入できない' do
        @order_shipping_address.addresses = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが存在しないと購入できない' do
        @order_shipping_address.phone_number = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以内でないと購入できない' do
        @order_shipping_address.phone_number = "123456789012"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが存在しないと購入できない' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end
