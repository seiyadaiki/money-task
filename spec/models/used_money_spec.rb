require 'rails_helper'

describe User do
  before do
    @used_money = FactoryBot.build(:used_money)
  end

  describe 'お金支出登録' do
    context '支出登録がうまくいくとき' do
      it 'date,what,how_much,way_idが存在すれば登録できる' do
        expect(@used_money).to be_valid
      end
      it 'locationが存在しなくても登録できる' do
        @used_money.location = ''
        @used_money.valid?
      end
    end
    context '支出登録がうまくいかないとき' do
      it 'dateが空だと登録できない' do
        @used_money.date = ''
        @used_money.valid?
        expect(@used_money.errors.full_messages).to include("Date can't be blank")
      end
      it 'whatが空だと登録できない' do
        @used_money.what = ''
        @used_money.valid?
        expect(@used_money.errors.full_messages).to include("What can't be blank")
      end
      it 'whatが11文字以上だと登録できない' do
        @used_money.what = 'あああああああああああ'
        @used_money.valid?
        expect(@used_money.errors.full_messages).to include('What is too long (maximum is 10 characters)')
      end
      it 'locationが11文字以上だと登録できない' do
        @used_money.location = 'あああああああああああ'
        @used_money.valid?
        expect(@used_money.errors.full_messages).to include('Location is too long (maximum is 10 characters)')
      end
      it 'how_muchが空だと登録できない' do
        @used_money.how_much = ''
        @used_money.valid?
        expect(@used_money.errors.full_messages).to include("How much can't be blank")
      end
      it 'how_muchが漢字だと登録できない' do
        @used_money.how_much = '千'
        @used_money.valid?
        expect(@used_money.errors.full_messages).to include('How much is invalid. Input half-width numbers')
      end
      it 'how_muchが英語だと登録できない' do
        @used_money.how_much = 'thousand'
        @used_money.valid?
        expect(@used_money.errors.full_messages).to include('How much is invalid. Input half-width numbers')
      end
      it 'how_muchが全角だと登録できない' do
        @used_money.how_much = '１０００'
        @used_money.valid?
        expect(@used_money.errors.full_messages).to include('How much is invalid. Input half-width numbers')
      end
      it 'way_idが空(id=0)だと登録できない' do
        @used_money.way_id = 0
        @used_money.valid?
        expect(@used_money.errors.full_messages).to include("Way can't be blank")
      end
    end
  end
end
