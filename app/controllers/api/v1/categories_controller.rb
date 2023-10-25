class Api::V1::CategoriesController < ApplicationController
    def index
        @categories = Category.all 
        render json: @categories, status: :ok
    end

    def show
        @category = Category.find_by(id: params[:id])
        render json: @category, status: :ok
    end

    def create 
        @category =  Category.new(category_params)
        if @category.save
            render json: @category, status: :created
        else
            render json: {errors: @category.errors.full_messages},
            status: :unprocessable_entity
        end
    end

    private
    def category_params
        params.require(:category).permit(:name, :description)
    end
end
