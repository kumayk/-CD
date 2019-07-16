class Label < ApplicationRecord
	has_many :items, inverse_of: :user
end
