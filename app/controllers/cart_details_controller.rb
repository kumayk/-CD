class CartDetailsController < ApplicationController
	def show
		@cart = CartDetail.all
		@totalprice = CartDetail.all.sum(:price)
		@totalquantity = CartDetail.all.sum(:quantity)
	end

	def create
	end

	def update
	end

	def destroy
	end
end
