class ProductsController < ApplicationController

    before_action :set_product, only: [:show, :edit, :update]
    
    def index
        @products = Product.all
        @user = current_user
    end

    def show
        @user = current_user
    end

    def new
        if !current_user.admin
            redirect_to products_path
        else
            @product = Product.new
        end
    end

    def create
        @product = Product.create(product_params)
        redirect_to product_path(@product)
    end

    def edit
        redirect_to product_path(@aproduct) if !current_user.admin
    end

    def update
        @product.update(product_params)
        redirect_to product_path(@aproduct)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end

    def set_attraction
        @attraction = Attraction.find(params[:id])
    end

end
