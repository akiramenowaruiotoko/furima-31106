require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it do
        'name, info, category_id, sales_status_id, shipping_fee_status_id, prefectur_id, scheduled_delivery_id, priceが存在すれば商品出品できる'
        expect(@item).to be_valid
      end
      it do
        '商品価格は半角数字かつ300~9999999の間であれば商品出荷できる'
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it do
        '商品画像を1枚つけないと商品出品できない'
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it do
        '商品名がないと商品出品できない'
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it do
        '商品の説明がないと商品出品できない'
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it do
        'カテゴリー情報がないと商品出品できない'
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it do
        '商品状態の情報がないと商品出品できない'
        @item.sales_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank", 'Sales status is not a number')
      end
      it do
        '配送料負担の情報がないと商品出品できない'
        @item.shipping_fee_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank", 'Shipping fee status is not a number')
      end
      it do
        '配送元の地域の情報がないと商品出品できない'
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it do
        '配送までの日数についての情報がないと商品出品できない'
        @item.scheduled_delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", 'Scheduled delivery is not a number')
      end
      it do
        '価格についての情報がないと商品出品できない'
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it do
        '価格の範囲が300未満だと商品出品できない'
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it do
        '価格の範囲が10000000以上だと商品出品できない'
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it do
        '販売価格が全角数字だと商品出品できない'
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
