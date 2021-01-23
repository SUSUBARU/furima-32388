class UserItem
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :token

  # ここにバリデーションの処理を書く

    with_options presence: true do
      validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
      validates :prefecture_id
      validates :city
      validates :addresses
      validates :building_name
      validates :phone_number, format: { with: /\A\d{11}\z/, message: 'を入力してください' }
      validates :token
    end
  
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
  
    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
  #buyバリデーション切取 ここまで

  def save
    # 各テーブルにデータを保存する処理を書く
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.create(user_id: user_id)
    # 商品の情報を保存
    Item.create(item_id: item_id)
    Buy.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number)
  end
end