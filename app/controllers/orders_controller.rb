class OrdersController < ApplicationController
	# before_action :authenticate_user
	def show
		@order = Order.find(params[:id])
	end

	def create
	end

	def new
		@order = Order.new
		@orders = Order.find(1)
		@cart_detail = CartDetail.all
		@cart_detail = current_user.cart_details
	end
end
