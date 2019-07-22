class Order < ApplicationRecord
	has_many :order_details, inverse_of: :user

	enum payment: {振り込み:1, 代引き:2, クレジットカード:3}
	enum order_status: { Recieved: 0, Pending: 1, Shipped: 2 }

	accepts_nested_attributes_for :order_details, allow_destroy: true
end
