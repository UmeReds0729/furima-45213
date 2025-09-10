require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    user = FactoryBot.build_stubbed(:user)
    item = FactoryBot.build_stubbed(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
  end
  
  describe '商品の購入' do
    context '商品が購入できる場合' do
      it '必須項目を全て入力すれば購入できる' do
        expect(@order_shipping_address).to be_valid
      end
      it 'buildingは未入力でも購入できる' do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it 'tokenが空では購入できない' do
        @order_shipping_address.token = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:token]).to include("can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:postal_code]).to include("can't be blank")
      end
      it 'postal_codeが正しい形式でないと購入できない' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:postal_code]).to include("is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが未選択では購入できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:prefecture_id]).to include("can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:city]).to include("can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:address]).to include("can't be blank")
      end
      it 'phoneが空では購入できない' do
        @order_shipping_address.phone = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:phone]).to include("can't be blank")
      end
      it 'phoneが9桁以下では購入できない' do
        @order_shipping_address.phone = '090000'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:phone]).to include("is too short")
      end
      it 'phoneが10～11桁の半角数字のみでないと購入できない' do
        @order_shipping_address.phone = '090-0000-0000'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:phone]).to include("is invalid. Input only number")
      end
      it 'userが紐付いていないと購入できない' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:user_id]).to include("can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors[:item_id]).to include("can't be blank")
      end
    end
  end
end
