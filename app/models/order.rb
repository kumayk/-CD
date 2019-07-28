class Order < ApplicationRecord
	has_many :order_details, inverse_of: :order, dependent: :destroy
	belongs_to :user

	enum payment: {振り込み: 0, 代引き: 1, クレジットカード: 2}
	enum order_status: { Recieved: 0, Pending: 1, Shipped: 2 }

	accepts_nested_attributes_for :order_details, allow_destroy: true
end

