require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "nickname,email,password,password_confirmation,last_name,last_name_kana,first_name,first_name_kana,birthdayが存在するとき登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録ができないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emialは@を含まないと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "英字のみのパスワードでは登録できない" do
        @user.password = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "数字のみのパスワードでは登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに全角文字を含むと登録できない" do
        @user.password = 'ヤマダリクタロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが空だと登録できない" do 
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "姓（全角）が空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "姓（全角）に半角文字が含まれていると登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "名（全角）が空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名（全角）に半角文字が含まれていると登録できない" do
        @user.first_name = 'rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "姓（カタカナ）が空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "姓（カタカナ）にカタカナ以外（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "名（カタカナ）が空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名（カタカナ）にカタカナ以外（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_kana = '陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end 
  end
end

