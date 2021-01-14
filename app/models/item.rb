class Item < ApplicationRecord
  belongs_to :user
  has_one :user_item
  has_one_attached :image

  validates :name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :burden_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_date_id, presence: true
  with_options presence: true, format: { with: /\A[\d]+\z/, message: 'には半角数字を使用してください'  } do
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:9,999,999, message: "is out of setting range"}
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date

  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }

end
