class AddReferenceOfProductToCartitem < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :carts
    add_reference :cart_items, :products
  end
end
