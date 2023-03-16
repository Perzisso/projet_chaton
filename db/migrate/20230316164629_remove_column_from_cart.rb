class RemoveColumnFromCart < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart, :user_id
    remove_column :cart, :item_id
  end
end
