class Item < ApplicationRecord

  validates :image, presence: true
  validates :product, presence: true
  validates :product_description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :product_condition_id, presence: true, numericality: { other_than: 1 }
  validates :ship_burden_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :ship_day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :ship_burden
  belongs_to :prefecture
  belongs_to :ship_day
  
end
