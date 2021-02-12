class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :product_description, :category_id, :product_condition_id, :ship_burden_id,
                                 :prefecture_id, :ship_day_id, :price).merge(user_id: current_user.id)
  end
end
