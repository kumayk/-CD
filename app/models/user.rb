class User < ApplicationRecord
	has_many :shipping_addresses, inverse_of: :user
	has_many :reviews, inverse_of: :user
	has_many :cart_details, inverse_of: :user
	has_many :order_details, inverse_of: :user
	has_many :orders, inverse_of: :user, dependent: :destroy


	acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :reviews, dependent: :destroy
end
