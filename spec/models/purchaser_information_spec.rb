require 'rails_helper'

RSpec.describe PurchaserInformation, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchaser_information = FactoryBot.build(:purchaser_information, user_id: user.id, item_id: item.id)
      sleep 0.1 
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchaser_information).to be_valid
      end
      it 'buildingは空でも保存できること' do
        expect(@purchaser_information).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できない' do
        @purchaser_information.postal_code = ''
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列以外保存できない' do
        @purchaser_information.postal_code = '111-111'
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Postal code 3桁ハイフン4桁」の半角文字列のみ入力してください")
      end
      it '都道府県は「---」が選択されている場合は保存できない' do
        @purchaser_information.prefecture_id = 1
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空では保存できない' do
        @purchaser_information.city = ''
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @purchaser_information.block = ''
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空では保存できない' do
        @purchaser_information.phone_number = ''
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は9桁以下では登録できない' do
        @purchaser_information.phone_number = '11111'
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Phone number 10桁以上11桁以内の半角数値のみで入力してください")
      end
      it '電話番号は12桁以上では登録できない' do
        @purchaser_information.phone_number = '111222233334'
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Phone number 10桁以上11桁以内の半角数値のみで入力してください")
      end
      it '電話番号は半角数値以外を含むと登録できない' do
        @purchaser_information.phone_number = '1112222333a'
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Phone number 10桁以上11桁以内の半角数値のみで入力してください")
      end
      it "tokenが空では登録できないこと" do
        @purchaser_information.token = nil
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐づいていないと登録できない" do
        @purchaser_information.user_id = nil
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐づいていないと登録できない" do
        @purchaser_information.item_id = nil
        @purchaser_information.valid?
        expect(@purchaser_information.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end