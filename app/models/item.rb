class Item < ApplicationRecord
  has_many :carts
  has_many :users, through: :cart
  has_many :orders
  has_many :users, through: :order
  has_one  :cat_img

end
