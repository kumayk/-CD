class Order < ApplicationRecord
	has_many :order_details, inverse_of: :user
end
