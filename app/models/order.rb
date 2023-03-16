class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :cart

  def total
  end

end
