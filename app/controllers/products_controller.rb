class ProductsController < ApplicationController

    #before_action :set_product, only: [:index, :new]
    
    def index
        @products = Product.all
        @user = current_user
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)
        redirect_to product_path(@product)
    end

    def update
        @product.update(product_params)
        redirect_to product_path(@aproduct)
    end

    private

    def product_params
        params.require(:product).permit(:name)
    end

end
