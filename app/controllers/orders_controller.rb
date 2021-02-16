class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @orderaddress = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orderaddress = OrderAddress.new(orderaddress_params)
    if @orderaddress.valid?
      pay_item
      @orderaddress.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def orderaddress_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :prefecture_city, :prefecture_block, :prefecture_buildin, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: orderaddress_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
