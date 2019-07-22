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
		@orders = Order.find(1)
		@order = Order.new
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
	    @order.save
	    # 完了画面を表示
	    render :action => 'commit'
    end


private

  def order_params
     params.require(:order).permit(:total_price, :shipping_address, :payment)
  end

  def shipping_params
     params.require(:shipping_address).permit(:shipping_name, :address, :zip_code, :phone_number, :user_id)
  end

end




