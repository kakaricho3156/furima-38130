require 'rails_helper'

RSpec.describe BuyingItem, type: :model do
  before do
    @buying_item = FactoryBot.build(:buying_item)
end

context "内容に問題がない" do
  it "priceがあれば保存できる" do
    expect(@buying_item).to be_valid
  end
end

context "内容に問題がある" do
  it "priceがあれば保存できない" do
   @buying_item.price=nil
   expect(@buying_item.errors.full_messages).to include("Price can't be blank")
  end
end
end
