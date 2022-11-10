require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'emailは一意性でないと登録できない' do
     @user.save
     another_user = FactoryBot.build(:user)
     another_user.email = @user.email
     another_user.valid?
     expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordは6文字以上でないと登録できない' do
      @user.password = '1aaaa'
      @user.password_confirmation = '1aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = '012345'
      @user.password_confirmation = '012345'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
     it 'last_nameが空では登録できない' do
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("名字を入力してください")
     end
      it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameは全角以外では登録できない' do
       @user.last_name = 'yamada'
       @user.valid?
       expect(@user.errors.full_messages).to include("名字全角文字を使用してください")
      end
      it 'first_nameは全角以外では登録できない' do
        @user.first_name = 'tatuya'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前全角文字を使用してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it 'last_name_kanaは全角カタカナ以外では登録できない' do
      @user.last_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字カナ全角カタカナを使用してください")
      end
      it 'first_name_kanaは全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ全角カタカナを使用してください")
      end
      it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      end
  end
end