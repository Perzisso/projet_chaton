class AddIndexsToCartTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart, :user, foreign_key: true
    add_reference :cart, :item, foreign_key: true
  end
end
