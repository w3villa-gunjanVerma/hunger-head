class Api::V1::CartController < ApplicationController

    def show
    end

    def addToCart
        binding.pry
        if @current_user.cart
            puts "cart is present----------------------------------------------------------------"
            binding.pry
            @product = Product.find(params[:product_id])
            @cart = @current_user.cart
            @cart_item = CartItem.find_or_initialize_by(cart: @cart , product: @product)
            @cart_item.quantity_in_cart+=1
            @cart_item.cart_item_total = @cart.quantity_in_cart * @product.price
            if @cart_item.save
                puts "cart created"
                render json: @cart_item, status: :created
            else
                render json: {errors: @cart.errors.full_messages},
                status: :unprocessable_entity
            end
        else
            create_cart
        end
    end

    def removeFromCart
    end

    def update_cart_quantity
    end

    def create_cart
        binding.pry
            @cart = Cart.new(user: @current_user)
            if @cart.save
                binding.pry
                puts "cart created"
                render json: @cart, status: :created
            else
                render json: {errors: @cart.errors.full_messages},
                status: :unprocessable_entity
            end
    end
end
