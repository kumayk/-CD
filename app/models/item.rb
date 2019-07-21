class Item < ApplicationRecord
	enum item_status: {販売中:1, 販売停止中:2}

    has_many :reviews, inverse_of: :item, dependent: :destroy
	attachment :image
	belongs_to :artist
	belongs_to :label
	belongs_to :category

	has_many :songs, inverse_of: :disk
    has_many :disks, inverse_of: :item, dependent: :destroy

	has_many :cart_details, inverse_of: :item
	has_many :order_details, inverse_of: :item
	accepts_nested_attributes_for :disks, allow_destroy: true

end

