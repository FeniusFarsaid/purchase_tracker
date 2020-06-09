class Product < ApplicationRecord

    validates :name, presence: true, length: { maximum: 20}, uniqueness: true
    validates :price, presence: true, length: {maximum: 6}

    has_many :purchases
    has_many :users, through: :purchases

end
