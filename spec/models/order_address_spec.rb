require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/flag.png')
    @item.save
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1 
end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it '全ての値が入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも購入できる事' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
      it 'post_codeは3桁ハイフン4桁の半角文字列のみ購入できる事' do
        @order_address.post_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it 'telephone_numberは10桁以上11桁以内の半角数値のみ購入できる事' do
        @order_address.telephone_number = '08012345678'
        expect(@order_address).to be_valid
      end
    end

    context '商品購入出来ない場合' do
      it 'post_codeが空だと購入出来ない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'postage_area_idが未選択だと購入出来ない' do
        @order_address.postage_area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postage area can't be blank")
      end
      it 'municipalitiesが空だと購入出来ない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_numberが空だと購入出来ない' do
        @order_address.street_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'telephone_numberが空だと購入出来ない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberに半角数字以外が含まれている場合購入出来ない' do
        @order_address.telephone_number = '０８０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'tokenが空では購入出来ない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
      

