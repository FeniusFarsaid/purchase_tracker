# README

private

    def signup_params
        params.require(:user).permit( :name,
                                      :email,
                                      :password,
                                      :password_confirmation)
    end 

    def account_update_params
        params.require(:user).permit( :name,
                                      :email,
                                      :password,
                                      :password_confirmation,
                                      :current_password)
    end 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

User 
has_many purchases
has_many products through purchases

Product
has_many purchases
has_many user through purchases
name

Purchases
belongs_to a user
belongs_to a product
date
quantiity
vendor
user_id
product_id

class RegistrationsController < Devise::RegistrationsController

    private

    def signup_params
        params.require(:user).permit( :name,
                                      :email,
                                      :password,
                                      :password_confirmation)
    end 

    def account_update_params
        params.require(:user).permit( :name,
                                      :email,
                                      :password,
                                      :password_confirmation,
                                      :current_password)
    end 

end

