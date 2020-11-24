require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、password,password_confirmation,name,namekana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'kkkgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが@の後に文字がないと登録できない' do
        @user.email = 'kkk@'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'kkk11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'kkkkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'kkk111'
        @user.password_confirmation = '111kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid. Input full-width characters.')
      end
      it 'nameが数字だと登録できない' do
        @user.name = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid. Input full-width characters.')
      end
      it 'nameが半角だと登録できない' do
        @user.name = 'ｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid. Input full-width characters.')
      end
      it 'namekanaが空だと登録できない' do
        @user.namekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Namekana is invalid. Input full-width katakana characters.')
      end
      it 'namekanaが漢字だと登録できない' do
        @user.namekana = '金銭太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Namekana is invalid. Input full-width katakana characters.')
      end
      it 'namekanaがひらがなだと登録できない' do
        @user.namekana = 'きんせんたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Namekana is invalid. Input full-width katakana characters.')
      end
      it 'namekanaが半角だと登録できない' do
        @user.namekana = 'ｷﾝｾﾝﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Namekana is invalid. Input full-width katakana characters.')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
