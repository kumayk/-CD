class CartDetailsController < ApplicationController
	before_action :setup_cart_detail!, only: [:cerate]

	def index
		@cart = CartDetail.all
		@cart = current_user.cart_details
	    @totalprice = 0
	    @cart.each do |cart|
	    	@itemprice = cart.item.price * cart.quantity
	    	@totalprice += @itemprice
	    end
    end

	def create
	    @cart_item = current_user.cart_details.build(cart_detail)
	    @cart_item.save
        redirect_to cart_details_path
	end

	def update
	    cart = CartDetail.find(params[:id])
	    cart.update(cart_params)
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

    def cart_detail
      params.require(:cart_detail).permit(:quantity, :item_id)
    end

    def cart_params
      params.require(:cart_detail).permit(:quantity)
    end


end