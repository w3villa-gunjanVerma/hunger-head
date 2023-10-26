class Product < ApplicationRecord
    belongs_to :category
    has_many :cart_item
    has_many :cart, through: :cart_item
end