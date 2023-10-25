class Api::V1::CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update]
    def index
        @categories = Category.all 
        render json: @categories, status: :ok
    end

    def show
        render json: @category, status: :ok
    end

    def create 
        @category =  Category.new(category_params)
        if @category.save
            render json: @category, status: :created
        else
            render json: {errors: @category.errors.full_messages},
        end
    end

    def update
        if !@category.update(category_params)
            render json: { errors: @category.errors.full_messages }
            render json: @category
        end
    end

    private
    def category_params
        params.permit(:name, :description)
    end
    def set_category
        @category = Category.find_by(id: params[:id])
    end
end
