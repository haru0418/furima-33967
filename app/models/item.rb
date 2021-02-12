class Item < ApplicationRecord

  validates :image, presence: true
  validates :product, presence: true, length: { maximum: 40 }
  validates :product_description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: 'status Select' }
  validates :product_condition_id, presence: true, numericality: { other_than: 1, message: 'status Select' }
  validates :ship_burden_id, presence: true, numericality: { other_than: 1, message: 'status Select' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'status Select' }
  validates :ship_day_id, presence: true, numericality: { other_than: 1, message: 'status Select' }
  validates :price, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :ship_burden
  belongs_to :prefecture
  belongs_to :ship_day
  
end
