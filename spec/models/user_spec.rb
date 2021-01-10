require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、password、password_confirmation、last_name、first_name、last_name_reading、first_name_reading、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが存在すれば登録できる" do
        @user.nickname = "test"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で、半角英数混合あれば登録できる" do
        @user.password = "test2222"
        @user.password_confirmation = "test2222"
        expect(@user).to be_valid
      end
      it "last_nameが存在し、全角であれば登録できる" do
        @user.last_name = "田中"
        expect(@user).to be_valid
      end
      it "first_nameが存在し、全角であれば登録できる" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "last_name_readingが存在し、全角カナであれば登録できる" do
        @user.last_name_reading = "タナカ"
        expect(@user).to be_valid
      end
      it "first_name_readingが存在し、全角カナであれば登録できる" do
        @user.first_name_reading = "タロウ"
        expect(@user).to be_valid
      end
      it "birthdayが存在すれば登録できる" do
        @user.birthday = "1930-01-01"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが@を含まれなければ登録できない" do
        @user.email = "www.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが英字のみだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが全角文字だと登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが存在しなければ登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角でなければ登録できない" do
        @user.last_name = "tttt"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
      end
      it "first_nameが存在しなければ登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角でなければ登録できない" do
        @user.first_name = "tttt"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end
      it "last_name_readingが存在しなければ登録できない" do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it "last_name_readingが全角カナでなければ登録できない" do
        @user.last_name_reading = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading にはカタカナを使用してください")
      end
      it "first_name_readingが存在しなければ登録できない" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "first_name_readingが全角カナでなければ登録できない" do
        @user.first_name_reading = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading にはカタカナを使用してください")
      end
      it "birthdayが存在しなければ登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

