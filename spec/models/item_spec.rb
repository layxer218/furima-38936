require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "商品出品ができるとき" do
      it "item_name,explane,category_id,item_state_id,charge_id,area_id,deliver_day_id,priceが存在するとき登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品ができないとき" do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        #binding.pry
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空だと登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "explaneが空だと登録できない" do
        @item.explane = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explane can't be blank")
      end
      it "categoryが「---」だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "item_stateが「---」だと登録できない" do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item state can't be blank")
      end
      it "chhargeが「---」だと登録できない" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it "areaが「---」だと登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "deliver_dayが「---」だと登録できない" do
        @item.deliver_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliver day can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceに半角数字以外が含まれていると登録できない" do
        @item.price = '価格'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300円未満だと登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9,999,999円を超えると登録できない" do
        @item.price = 50000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "userが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
