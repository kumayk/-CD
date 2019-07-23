class CartDetailsController < ApplicationController
	before_action :setup_cart_detail!, only: [:cerate, :update]

	def index
		@cart = CartDetail.all
		@cart = current_user.cart_details
	    @totalprice = 0
	    @cart.each do |cart|
	    	@totalprice += cart.item.price
	    end
    end

	def create
	    @cart_item = current_user.cart_details.build(item_id: params[:cart_detail][:item_id])
	    @cart_item.save
        redirect_to cart_details_path
	end

	def update
	    cart_item.update(quantity: params[:quantity].to_i)
        redirect_to cart_details_path
	end

	def destroy
	    cart = CartDetail.find(params[:id])
	    cart.destroy
        redirect_to cart_details_path
	end

	private

	def setup_cart_item!
        @cart_item = current_user.items.find(item_id: params[:item_id])
    end
end