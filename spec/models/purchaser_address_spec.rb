require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchaser_address = FactoryBot.build(:purchaser_address, user_id: user.id, item_id: item.id)
  end

  describe '購入者情報' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchaser_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @purchaser_address.building = ''
        expect(@purchaser_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @purchaser_address.postal_code = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @purchaser_address.postal_code = '1234567'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が空だと保存できないこと' do
        @purchaser_address.prefecture_id = '1'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が空だと保存できないこと' do
        @purchaser_address.city = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchaser_address.address = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchaser_address.phone_number = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、9桁以下だと保存できないこと' do
        @purchaser_address.phone_number = '123456789'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は、12桁以上だと保存できないこと' do
        @purchaser_address.phone_number = '123456789012'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は、半角数値のみでないと保存できないこと' do
        @purchaser_address.phone_number = '090-1234-5678'
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空だと購入できないこと' do
        @purchaser_address.item_id = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'item_id（購入商品）が空だと購入できないこと' do
        @purchaser_address.user_id = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenが空だと購入できないこと' do
        @purchaser_address.token = ''
        @purchaser_address.valid?
        expect(@purchaser_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
