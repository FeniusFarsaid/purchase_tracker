class RemoveProductNameFromPurchase < ActiveRecord::Migration[6.0]
  def change

    remove_column :purchases, :product_name, :string
  end
end
