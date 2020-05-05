class PurchasesController < ApplicationController
    before_action :set_user

    def index
        @purchases = @user.purchases
    end

    def new
        @purchase = Purchase.new
        @purchase.product = Product.new
        @Products = Product.all
    end

    # def create
    #     @product = Product.find(params[:product_id])
    #     @purchase = Purchase.new(user_id: current_user.id, product_id: product.id)
    #     redirect_to user_path(current_user)
    # end

    def create
        if params[:product_id]
            @product = Product.find_by(id: params[:product_id])
        else
            @product = Product.find_or_create_by(product_params)
        end
        @user.products << @product if (@product && !@user.products.include?(@product))
        redirect_to purchases_path
    end

    def destroy
        purchase = Purchase.find(params[:id])
        if purchase.user == current_user
            purchase.destroy
        end
        redirect_to purchases_path
    end

    private

    def set_user
        @user = current_user
    end

    def product_params
        params.require(:purchase).permit(product_attributes: [:date, :quantity, :vendor, :user_id, :product_id])[:product_attributes]
    end
end
