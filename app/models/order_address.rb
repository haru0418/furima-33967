class OrderAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :prefecture_city, :prefecture_block, :prefecture_buildin, :phone_number, :order_id, :user_id, :item_id
  
  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'status Select' }
    validates :prefecture_city
    validates :prefecture_block
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'Input only number' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, prefecture_city: prefecture_city, prefecture_block: prefecture_block, prefecture_buildin: prefecture_buildin, phone_number: phone_number, order_id: order.id)
  end
end