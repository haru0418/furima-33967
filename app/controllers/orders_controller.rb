class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @orderaddress = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @orderaddress = OrderAddress.new(orderaddress_params)
    if @orderaddress.valid?
      @orderaddress.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def orderaddress_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :prefecture_city, :prefecture_block, :prefecture_buildin, :phone_number, :order_id, :item_id).merge(user_id: current_user.id)
  end
end
