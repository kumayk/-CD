class Disk < ApplicationRecord
	belongs_to :item
	has_many :songs, inverse_of: :disk, dependent: :destroy
	accepts_nested_attributes_for :songs, allow_destroy: true
end
