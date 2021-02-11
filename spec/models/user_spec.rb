require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

    end


   context '新規登録がうまくいかないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it "emailが＠を含まないと登録できない" do
      @user.email = "test.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email は＠を含んでください")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
   end

   it "passwordが５文字以下であれば登録できないこと" do
     @user.password ="12345"
     @user.password_confirmation ="12345"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end

   it "passwordとpassword_confirmationが不一致では登録できないこと" do
     @user.password = "a11111"
     @user.password_confirmation = "b11111"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end

   it "passwordが半角数字のみの場合は登録できない" do
     @user.password = "123456"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password は半角英数字で入力してください")
   end

   it "passwordが半角英字のみの場合は登録できない" do
     @user.password = "aaaaaa"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password は半角英数字で入力してください")
   end

   it "passwordは全角では登録できないこと" do
     @user.password = "AAAAAA"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password は半角英数字で入力してください")
   end


    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = '' 
      user.valid?
      expect(user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
 end
end