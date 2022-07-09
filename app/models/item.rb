class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :item_condition_id, presence: true
  validates :item_category_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:condition,:day_to_ship,:delivery_charge,:prefecture
  validates :item_condition_id, numericality: { other_than: 1}
  validates :item_category_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1}
  validates :days_to_ship_id, numericality: { other_than: 1}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
