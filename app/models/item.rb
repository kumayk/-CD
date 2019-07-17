class Item < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  has_many :reviews, dependent: :destroy
=======
	attachment :image
	belongs_to :artist
	belongs_to :label
	belongs_to :category

	has_many :disks, inverse_of: :item
	has_many :reviews, inverse_of: :item
	has_many :cart_details, inverse_of: :item
	has_many :order_details, inverse_of: :item
	accepts_nested_attributes_for :disks, allow_destroy: true
>>>>>>> aki/master
end
