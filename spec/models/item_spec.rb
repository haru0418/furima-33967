require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能が保存できる場合' do
    it 'image.product.product_description.category_id.product_condition_id.ship_burden_id.prefecture_id.ship_day_id.priceあれば保存できる' do
      expect(@item).to be_valid
    end
  end

  describe '商品出品機能が保存できない場合' do
    it 'imageがなければ出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'productがないと出品できない' do
      @item.product = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product can't be blank")
    end
    it 'product_descriptionと出品できない' do
      @item.product_description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product description can't be blank")
    end
    it 'category_idがないと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category status Select')
    end
    it 'category_idが1を選択している場合は出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category status Select')
    end
    it 'product_condition_idがないと出品できない' do
      @item.product_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Product condition status Select')
    end
    it 'product_condition_idが1を選択している場合は出品できない' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Product condition status Select')
    end
    it 'ship_burden_idがないと出品できない' do
      @item.ship_burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship burden status Select')
    end
    it 'ship_burden_idが1を選択している場合は出品できない' do
      @item.ship_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship burden status Select')
    end
    it 'prefecture_idがないと出品できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture status Select')
    end
    it 'prefecture_idが1を選択している場合は出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture status Select')
    end
    it 'ship_day_idがないと出品できない' do
      @item.ship_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship day status Select')
    end
    it 'ship_day_idが1を選択している場合出品できない' do
      @item.ship_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship day status Select')
    end
    it 'priceがない出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと出品できない' do
      @item.price = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceが半角英数混合ではできない' do
      @item.price = '111aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceが半角英語だけではできない' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceが300円以下だとだと出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceが99,999,999円以上だと出品できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end