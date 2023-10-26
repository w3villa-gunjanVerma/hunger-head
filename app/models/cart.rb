class Cart < ApplicationRecord
    has_one :user
    has_many :cart_item
    has_many :products , through: :cart_item
    belongs_to :user
end
