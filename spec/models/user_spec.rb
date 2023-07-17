require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,last_name,last_name_kana,first_name,first_name_kana,birthdayが存在するとき登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emialは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordに全角文字を含むと登録できない' do
        @user.password = 'ヤマダリクタロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '姓（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it '名（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'rikutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は不正な値です')
      end
      it '姓（カタカナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it '姓（カタカナ）にカタカナ以外（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end
      it '名（カタカナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
      end
      it '名（カタカナ）にカタカナ以外（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = '陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
