class Item < ApplicationRecord

  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :ship_burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :ship_day_id, presence: true
  validates :price, presence: true

  belongs_to :user
end
