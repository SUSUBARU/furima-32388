require 'rails_helper'

describe Item do
  before do
    @user = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品がうまくいくとき' do
      it "必要な情報を適切に入力すると、商品の出品ができる" do
        expect(@item).to be_valid
      end
      it "商品画像を1枚つければ、商品の出品ができる" do
        @item.image = "商品画像.png"
        expect(@item).to be_valid
      end
      it "商品名を入力すれば、商品の出品ができる" do
        @item.name = "商品名"
        expect(@item).to be_valid
      end
      it "商品の説明を入力すれば、商品の出品ができる" do
        @item.explain = "商品説明"
        expect(@item).to be_valid
      end
      it "カテゴリーの情報を入力すれば、商品の出品ができる" do
        @item.category_id = "2"
        expect(@item).to be_valid
      end
      it "商品の状態についての情報を入力すれば、商品の出品ができる" do
        @item.state_id = "2"
        expect(@item).to be_valid
      end
      it "配送料の負担についての情報を入力すれば、商品の出品ができる" do
        @item.burden_id = "2"
        expect(@item).to be_valid
      end
      it "発送元の地域についての情報を入力すれば、商品の出品ができる" do
        @item.prefecture_id = "2"
        expect(@item).to be_valid
      end
      it "発送までの日数についての情報を入力すれば、商品の出品ができる" do
        @item.delivery_date_id = "2"
        expect(@item).to be_valid
      end
      it "価格についての情報を入力すれば、商品の出品ができる" do
        @item.price = "350"
        expect(@item).to be_valid
      end
      it "価格の範囲が、¥300~¥9,999,999の間であれば、商品の出品ができる" do
        @item.price = "350"
        expect(@item).to be_valid
      end
      it "販売価格は半角数字のみであれば、商品の出品ができる" do
        @item.price = "350"
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "商品画像を1枚つけなければ、商品の出品ができない" do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空であれば、商品の出品ができない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品の説明が空であれば、商品の出品ができない" do
        @item.explain = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "カテゴリーの情報が空であれば、商品の出品ができない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品の状態についての情報が空であれば、商品の出品ができない" do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "配送料の負担についての情報が空であれば、商品の出品ができない" do
        @item.burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "発送元の地域についての情報が空であれば、商品の出品ができない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "発送までの日数についての情報が空であれば、商品の出品ができない" do
        @item.delivery_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "価格についての情報が空であれば、商品の出品ができない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "価格の範囲が、¥300~¥9,999,999の間でなければ、商品の出品ができない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "販売価格が全角文字では、商品の出品ができない" do
        @item.price = "あああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "販売価格が全角カタカナでは、商品の出品ができない" do
        @item.price = "アアア"
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "販売価格が全角数字では、商品の出品ができない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "販売価格が半角英字では、商品の出品ができない" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end

