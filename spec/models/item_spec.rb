require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品ができる' do
      it 'image,name,info,category,status,fee,place,day,priceが存在すれば出品される' do
        expect(@item).to be_valid
      end
    end

    context '出品できない' do
      it 'imageがなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameがなければ出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoがなければ出品できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'categoryがなければ出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'statusがなければ出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it 'feeがなければ出品できない' do
        @item.fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 0')
      end
      it 'placeがなければ出品できない' do
        @item.place_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Place must be other than 0')
      end
      it 'dayがなければ出品できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 0')
      end
      it 'priceがなければ出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが299円以下のとき出品できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが10000000円以上のとき出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
