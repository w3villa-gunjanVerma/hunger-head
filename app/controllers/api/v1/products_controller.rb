class Api::V1::ProductsController < ApplicationController
    before_action :set_product , only[:show, :update]
    def index
        @products = Product.all
        render json: @products, status: :ok
    end
    
    def show
        render json: @product, status: :ok
    end
    
    def create
        binding.pry
        @product = Product.new(product_params)
        if @product.save
            render json: @product, status: :created
        else
            render json: {errors: @product.errors.full_messages},
            status: :unprocessable_etity
        end
    end
    def destroy
        @product.destroy
    end
    def update
        @product = Product.find_by(id: params[:id])
        if !@product.update(product_params)
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
          else
            render json: @product
        end
    end

    private
    def product_params
        params.permit(:name, :description, :quantity, :price, :is_active)
    end

    def set_product
        @product = Product.find_by(id: params[:id])
    end
end
