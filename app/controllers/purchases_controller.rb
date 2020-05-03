class PurchasesController < ApplicationController

    def index
        @purchases = @user.purchases
    end

    def new
        @purchase = Purchase.new
        @purchase.product = Product.new
        @Products = Product.all
    end

    def create
        if params[:product_id]
            @product = Product.find_by(id: params[:product_id])
        else
            @product = Product.find_or_create_by(product_params)
        end
        @user.products << @product if (@product && !@user.products.include?(@product))
        @user.save
        redirect_to purchases_path
    end

    def destroy
        library = Library.find(params[:id])
        if library.user == current_user
            library.destroy
        end
        redirect_to libraries_path
    end

    private

    def set_user
        @user = current_user
    end

    def product_params
        params.require(:purchase).permit(product_attributes: [:date, :quantity, :vendor, :user_id, :product_id])[:product_attributes]
    end
end
