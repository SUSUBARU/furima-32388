require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @user_item = FactoryBot.build(:user_item)
    @user_item.user_id = FactoryBot.build(:user)
    @user_item.item_id = FactoryBot.build(:item)
  end

  describe '購入情報登録' do
    context '購入情報登録がうまくいくとき' do
      it "必要な情報が存在すれば、登録できる" do
        expect(@user_item).to be_valid
      end
      it "建物名についての情報を入力しなくても、登録ができる" do
        @user_item.building_name = ""
        expect(@user_item).to be_valid
      end
    end

    context '購入情報登録がうまくいかないとき' do
      it "郵便番号が空であれば、登録ができない" do
        @user_item.postal_code = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンがなければ、登録ができない" do
        @user_item.postal_code = "1111111"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code 半角数字3文字ハイフン半角数字4文字を入力してください")
      end
      it "都道府県の情報が空であれば、登録ができない" do
        @user_item.prefecture_id = ""
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "都道府県の情報が1であれば、登録ができない" do
        @user_item.prefecture_id = 1
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市町村についての情報が空であれば、登録ができない" do
        @user_item.city = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("City can't be blank")
      end
      it "番地についての情報が空であれば、登録ができない" do
        @user_item.addresses = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Addresses can't be blank")
      end
      it "電話番号についての情報が空であれば、登録ができない" do
        @user_item.phone_number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が12桁以上であれば、登録ができない" do
        @user_item.phone_number = "111111111111"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number 半角数字11文字を入力してください")
      end
      it "電話番号についての情報が英数混合であれば、登録ができない" do
        @user_item.phone_number = "aaa11111111"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number 半角数字11文字を入力してください")
      end
      it "電話番号についての情報が全角数字であれば、登録ができない" do
        @user_item.phone_number = "１１１１１１１１１１１"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number 半角数字11文字を入力してください")
      end
      it "tokenが空では登録できないこと" do
        @user_item.token = ""
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが存在しないと登録できないこと" do
        @user_item.user_id = ""
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが存在しないと登録できないこと" do
        @user_item.item_id = ""
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

