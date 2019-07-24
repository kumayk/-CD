class OrdersController < ApplicationController
	# before_action :authenticate_user
	def show
		@order = Order.find(params[:id])
	end

	def create
	end

	def new
		@cart_detail = CartDetail.all
		@cart_detail = current_user.cart_details
		@order = Order.new
	    @order_detail = @order.order_details.build
		render :action => 'new'
	end

	def shipping_address_new
		@shipping_address = ShippingAddress.new
	end

	def shipping_address_create
		@shipping_address = ShippingAddress.new(shipping_params)
		@shipping_address.user_id = current_user.id
		@shipping_address.save!
		redirect_to new_order_path
	end

	def confirm

	    # 入力値のチェック
	    @cart_detail = CartDetail.all
		@cart_detail = current_user.cart_details
	    @order = Order.new(order_params)
	    if @order.valid?
	      # OK。確認画面を表示
	      render :action => 'confirm'
	    else
	      # NG。入力画面を再表示
	    	render :action => 'new'
	    end
    end

    def commit
	    @order = Order.new(order_params)
	    if @order.save
		    #cartの中身を削除
		    # redirect_to controller: 'cart_details', action: 'destroy'
		    # 完了画面を表示
		    render :action => 'commit'
		else
			# NG。入力画面を再表示
		    @cart_detail = CartDetail.all
			@cart_detail = current_user.cart_details
	    	render :action => 'new'
	    end
    end


private

  def order_params
     params.require(:order).permit(:total_price, :shipping_address, :payment, order_details_attributes: [:id, :quantity, :user_id, :item_id, :order_id])
  end

  def shipping_params
     params.require(:shipping_address).permit(:shipping_name, :address, :zip_code, :phone_number, :user_id)
  end

end



