class User < ApplicationRecord
  # Include default devise modules. Others available are:

  validates :name, presence: true, uniqueness: { case_sensitive: false}

  has_many :purchases
  has_many :products, through: :purchases 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end 


end
