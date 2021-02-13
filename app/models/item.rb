class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :product, length: { maximum: 40 }
    validates :product_description, length: { maximum: 1000 }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  with_options presence: true, numericality: { other_than: 1, message: 'status Select' } do
    validates :category_id
    validates :product_condition_id
    validates :ship_burden_id
    validates :prefecture_id
    validates :ship_day_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :ship_burden
  belongs_to :prefecture
  belongs_to :ship_day
end
