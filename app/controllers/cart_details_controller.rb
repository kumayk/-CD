class CartDetailsController < ApplicationController
 before_action :setup_cart_detail!, only: [:cerate, :update, :destroy]

	def show
	  @item = Item.find(id: @cart_item)
	  @cart_item = current_user.items

	end

	def create
	  @cart_item = current_user.cart_details.build(item_id: params[:cart_detail][:item_id])
	  @cart_item.save
      redirect_to cart_detail_path
	end

	def update
	  @cart_item.update(quantity: params[:quantity].to_i)
      redirect_to current_cart_detail
	end

	def destroy
	  @cart_item.destroy
      redirect_to current_cart_detail
	end

	private

	def setup_cart_item!
      @cart_item = current_user.items.find(item_id: params[:item_id])
    end

end
