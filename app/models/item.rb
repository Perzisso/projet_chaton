class Item < ApplicationRecord
  has_many :carts
  has_many :users, through: :cart
  has_many :orders
  has_many :users, through: :order
  has_one_attached :catimage

  validates :price, :name, :description, :image_url, presence: true
  validates :price, length: { minimum: 1 }
  validates :name, length: { minimum: 2 }
  validates :description, length: { in: 20..500 }
  validates :image_url, presence: true
end
