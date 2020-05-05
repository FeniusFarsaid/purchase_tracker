class AddProductNametoPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :product_name, :string
  end
end
