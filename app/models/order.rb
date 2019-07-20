class Order < ApplicationRecord
	has_many :order_details, inverse_of: :user
	enum order_status: { Recieved: 0, Pending: 1, Shipped: 2 }
end
