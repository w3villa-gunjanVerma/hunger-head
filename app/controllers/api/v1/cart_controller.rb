class Api::V1::CartController < ApplicationController
    before_action :create_cart
    def show
    end

    def addToCart
    end

    def removeFromCart
    end

    def update_cart_quantity
    end

    def create_cart
        @cart = Cart.find_or_create_by(user: @current_user)
        render json: @cart, status: :ok
    end
end
