class BuyingItemForm
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_number,:prefecture,:town,:address,:telephone,:building,:token

  with_options presence: true do

    validates :user_id
    validates :item_id

    validates :post_number,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :town
    validates :address
    validates :telephone, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token

  end

  def save
    buying_item=BuyingItem.create(user_id: user_id, item_id: item_id)
    Information.create(buying_item_id:buying_item.id,post_number: post_number,prefecture: prefecture,building: building,town:town,address:address,telephone:telephone)
  end
end