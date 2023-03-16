class Item < ApplicationRecord
  has_many :orders
  has_many :users, through: :order

end
