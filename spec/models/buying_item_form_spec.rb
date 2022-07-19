require 'rails_helper'

RSpec.describe BuyingItemForm, type: :model do
  before do
    @buying_item_form = FactoryBot.build(:buying_item_form)
  end

  describe "配達先の保存" do
    context "配送先が保存できる時" do
      it "全ての値が正しく入力されているとき" do
        expect(@buying_item_form).to be_valid
      end

      it "建物名がからでも保存できる" do
        @buying_item_form.building=nil
        expect(@buying_item_form).to be_valid
      end

    end

    context "配送先が保存できない時" do
      it "ユーザーIDがからの時" do
        @buying_item_form.user_id=nil
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("User can't be blank")
      end
      it "商品IDがからの時" do
        @buying_item_form.item_id=nil
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("Item can't be blank")
      end
      it "郵便番号が空の時" do
        @buying_item_form.post_number=nil
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("Post number can't be blank")
      end
      it "郵便番号に-をいれた時" do
        @buying_item_form.post_number="11_992_99"
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it "都道府県に---を選択した時" do
        @buying_item_form.prefecture=0
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "都道府県を空に選択した時" do
        @buying_item_form.prefecture=nil
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "市町村が空の時" do
        @buying_item_form.town=nil
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("Town can't be blank")
      end
      it "番地が空の時" do
        @buying_item_form.address=nil
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空の時" do
        @buying_item_form.telephone=nil
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("Telephone can't be blank")
      end
      it "tokenが空の時" do
        @buying_item_form.token=nil
        @buying_item_form.valid?
        expect(@buying_item_form.errors.full_messages).to include("Token can't be blank")
      end






    end


  
  end 
end
