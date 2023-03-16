class Cart < ApplicationRecord
  has_many :orders
  has_many :items, through: :order

  def total
  end

end
