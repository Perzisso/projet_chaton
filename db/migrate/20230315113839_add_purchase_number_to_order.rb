class AddPurchaseNumberToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :purchase_number, :string
  end
end
