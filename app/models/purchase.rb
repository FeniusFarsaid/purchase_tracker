class Purchase < ApplicationRecord

    validates :date, presence: true, length: { maximum: 150}
    validates :vendor, presence: true, length: { maximum: 20}
    validates :quantity, presence: true

    belongs_to :user
    belongs_to :product 

    #accepts_nested_attributes_for :product

end
