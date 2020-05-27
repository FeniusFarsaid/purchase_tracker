class PurchasesController < ApplicationController
    before_action :set_user

    def index
        @purchases = @user.purchases
    end

    def new
        @purchase = Purchase.new
        @purchase.product = Product.new
        @products = Product.all
    end

    def create
        #binding.pry
        @purchase = @user.purchases.create(purchase_params)
        #binding.pry
        redirect_to root_path
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

    def purchase_params
        params.require(:purchase).permit(:product_name, :date, :quantity, :vendor)
    end
end
