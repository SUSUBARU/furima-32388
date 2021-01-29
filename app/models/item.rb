class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :prefecture_id
    validates :delivery_date_id
  end
  with_options presence: true, format: { with: /\A[\d]+\z/, message: 'には半角数字を使用してください'  } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :prefecture_id
    validates :delivery_date_id
  end

  def was_attached?
    self.image.attached?
  end

end
