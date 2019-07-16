class Item < ApplicationRecord
	attachment :image
	belongs_to :artist
	belongs_to :label
	belongs_to :category

	has_many :disks, inverse_of: :item
	accepts_nested_attributes_for :disks, allow_destroy: true
end
