require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '購入できる' do
      it 'post_number,place,city,street,tell_numberが存在すれば購入できる' do
        expect(@order).to be_valid
      end
    end

    context '購入できない' do
      it 'tokenがなければ購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_numberにハイフンがなければ購入できない' do
        @order.post_number = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberがなければ購入できない' do
        @order.post_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post number can't be blank")
      end
      it 'placeがなければ購入できない' do
        @order.place_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Place must be other than 0')
      end
      it 'cityがなければ購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'streetがなければ購入できない' do
        @order.street = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Street can't be blank")
      end
      it 'tell_numberがなければ購入できない' do
        @order.tell_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Tell number can't be blank")
      end
      it 'tell_numberにハイフンがあれば購入できない' do
        @order.tell_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tell number is invalid')
      end
      it 'tell_numberが11桁以上あれば購入できない' do
        @order.tell_number = '111111111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tell number is invalid')
      end
    end
  end
end
