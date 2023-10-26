class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity_in_cart
      t.integer :cart_item_total
      t.timestamps
    end
  end
end
