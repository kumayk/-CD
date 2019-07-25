class Order < ApplicationRecord
	has_many :order_details, inverse_of: :order, dependent: :destroy
	belongs_to :user

	enum payment: {bank: 0, cash: 1, credit: 2}
	enum order_status: { Recieved: 0, Pending: 1, Shipped: 2 }

	accepts_nested_attributes_for :order_details, allow_destroy: true
end

