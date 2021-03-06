class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :condition_id, presence: true
  validates :category_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :image, presence: true
  has_one :buying_item
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :delivery_charge
  belongs_to :prefecture
  validates :condition_id, numericality: { other_than: 1}
  validates :category_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1}
  validates :days_to_ship_id, numericality: { other_than: 1}
  validates :price, presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true  }

end
