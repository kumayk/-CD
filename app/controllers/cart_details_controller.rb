class CartDetailsController < ApplicationController
	def show
		@items = Item.all
	end

	def create
	end

	def update
	end

	def destroy
	end
end
