require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
  
    describe '商品情報登録' do
      context '商品情報登録がうまくいくとき' do
        it "item_name,item_detail,category_id,item_condition_id,delivery_charge_id,prefecture_id,days_to_ship_id,priceがあれば登録できる" do
          expect(@item).to be_valid
        end
        it "priceが300以上で登録できる" do
          @item.price=3000
          expect(@item).to be_valid
        end
        it "商品状態が「---」以外であれば登録できる" do
          @item.item_condition_id=2
          expect(@item).to be_valid
        end

        it "配達料が「---」以外であれば登録できる" do
          @item.delivery_charge_id=2
          expect(@item).to be_valid
        end

        it "カテゴリーが「---」以外であれば登録できる" do
          @item.category_id=2
          expect(@item).to be_valid
        end

        it "発送元地域が「---」以外であれば登録できる" do
          @item.prefecture_id=2
          expect(@item).to be_valid
        end

        it "お届け日数が「---」以外であれば登録できる" do
          @item.days_to_ship_id=2
          expect(@item).to be_valid
        end



      end
  
      context '商品出品がうまくいかないとき' do
        it 'ユーザー登録している人でないと出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end

        it "画像が一枚ないと出品できない" do
          @item.image=nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "priceが空だと登録できない" do
          @item.price=""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
          
        end
        it "priceが数字以外だと登録できない" do
          @item.price="あああ"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it "priceが300未満だと登録できない" do
          @item.price="222"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it "priceが9,999,999以上だと登録できない" do
          @item.price="111111111111111111111111"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        

        it "商品名が空だと登録できない" do
          @item.item_name=""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it "商品内容が空だと登録できない" do
          @item.item_detail=""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item detail can't be blank")
        end
        it "商品状態が空だと登録できない" do
          @item.item_condition_id=""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item condition can't be blank")
        end
        it "商品状態が「---」だと登録できない" do
          @item.item_condition_id=1
          @item.valid?
          expect(@item.errors.full_messages).to include("Item condition must be other than 1")
        end
        it "商品カテゴリーが空だと登録できない" do
          @item.category_id=""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item category can't be blank")
        end
        it "商品カテゴリーが「---」だと登録できない" do
          @item.category_id=1
          @item.valid?
          expect(@item.errors.full_messages).to include("Item category must be other than 1")
        end
        it "配送料が空だと登録できない" do
          @item.delivery_charge_id=""
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
        end
        it "配送料が「---」だと登録できない" do
          @item.delivery_charge_id=1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
        end
        it "都道府県が空だと登録できない" do
          @item.prefecture_id=""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area can't be blank")
        end
        it "配送料が「---」だと登録できない" do
          @item.prefecture_id=1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
        end
        it "配送日時が空だと登録できない" do
          @item.days_to_ship_id=""
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship can't be blank")
        end
        it "配送料が「---」だと登録できない" do
          @item.days_to_ship_id=1
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
        end

        
     
     
  
      end
    end
  end


