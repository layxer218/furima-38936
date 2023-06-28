require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe "商品購入" do
    context "商品購入ができるとき" do
      it "zip_code,area_id,city,address,phone_numberが存在するとき登録できる" do
        expect(@order_form).to be_valid
      end
    end

    context "商品購入ができないとき" do
      it "zip_codeが空だと登録できない" do
        @order_form.zip_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Zip code can't be blank")
      end
      it "areaが「---」だと登録できない" do
        @order_form.area_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Area can't be blank")
      end
      it "cityが空だと登録できない" do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと登録できない" do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと登録できない" do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      
    end
  end

end
