require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいく時' do
      it '全ての値が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数値であれば出品できる' do
        @item.price = 2000
        expect(@item).to be_valid
      end
      it 'priceが300より多い時に出品できる' do
        @item.price = 2000
        expect(@item).to be_valid
      end
      it 'priceが9_999_999より少ない時に出品できる' do
        @item.price = 2000
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかない時' do
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'explanationが空だと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'item_condition_idが未選択だと出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it 'postage_player_idが未選択だと出品できない' do
        @item.postage_player_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage player can't be blank"
      end
      it 'postage_area_idが未選択だと出品できない' do
        @item.postage_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage area can't be blank"
      end
      it 'preparation_day_idが未選択だと出品できない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Preparation day can't be blank"
      end
      it '販売価格が¥300より少ない時は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が¥9999999より多い時は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
