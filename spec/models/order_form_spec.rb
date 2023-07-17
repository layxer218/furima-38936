require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end
  describe '商品購入' do
    context '商品購入ができるとき' do
      it '正しく入力できた場合は購入できる' do
        expect(@order_form).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_form.build_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'user_idが紐づいていないと登録できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが紐づいていないと登録できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Itemを入力してください")
      end
      it 'zip_codeが空だと登録できない' do
        @order_form.zip_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @order_form.zip_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('郵便番号にハイフンを入れてください')
      end
      it 'areaが「---」だと登録できない' do
        @order_form.area_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空だと登録できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("市町村を入力してください")
      end
      it 'addressが空だと登録できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと登録できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が9桁以下では登録できない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号が12桁以上では登録できない' do
        @order_form.phone_number = '1234567890123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('電話番号は不正な値です')
      end
      it '電話番号は半角数値でないと登録できない' do
        @order_form.phone_number = '123456789０'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空だと登録できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tokenを入力してください")
      end
    end
  end
end
