class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.datetime :date
      t.integer :quantity
      t.string :vendor
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
