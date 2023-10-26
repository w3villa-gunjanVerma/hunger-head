class AddUserToCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :user
  end
end
