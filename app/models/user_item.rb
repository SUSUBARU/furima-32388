class UserItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id, :order_id

  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'を入力してください' }
  end
  
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    # 商品の情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    Buy.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end