class Product < ApplicationRecord

    validates :name, presence: true, length: { maximum: 20}, uniqueness: true

    has_many :purchases
    has_many :users, through: :purchases

end
