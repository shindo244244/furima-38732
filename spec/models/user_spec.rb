require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'test.ne.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = 'aa11'
      @user.password_confirmation = 'aa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'お名前(全角)は、名字が必須であること' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'お名前(全角)は、名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前(全角)名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.family_name = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'お名前(全角)名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'ﾃｽﾄ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'お名前カナ(全角)は、名字が必須であること' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'お名前カナ(全角)は、名前が必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.family_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
