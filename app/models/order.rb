class Order < ApplicationRecord
  belongs_to :user
  has_one    :buy
  belongs_to :item
end
