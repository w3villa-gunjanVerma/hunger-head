class Cart < ApplicationRecord
    has_one :user
    has_many :cart_item
    has_many :products , throught: :cart_item
end
