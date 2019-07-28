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
		if @cart_detail.exists?
		@order = Order.new
	    @order_detail = @order.order_details.build
		else
			redirect_to cart_details_path(user_id: current_user.id),notice: 'カートが空っぽです'
		end
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
		@order.user_id = current_user.id
	    current_user.cart_details.each do |detail|
			@order.order_details.build(quantity: detail.quantity, user_id: detail.user_id, item_id: detail.item_id)
	    end



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
	    @order.sub_total_price = 0
	    @cart_details = CartDetail.all
		@cart_details = current_user.cart_details
		@order.user_id = current_user.id
	    @cart_details.each do |cd|
	    	@order.sub_total_price += cd.quantity * cd.item.price
		end
		@order.total_price = @order.sub_total_price + @order.shipping_fee

	    if @order.save!
		    #itemの在庫を減らす
		    @order.order_details.each do |od|
		    	item = Item.find(od.item_id)
		    	item.stock = item.stock - od.quantity
		    	item.save
		    end
		    #cartの中身を削除
		    @cart_details.destroy_all
		    # 完了画面を表示
		    redirect_to order_path(@order.id)
		else
			# NG。入力画面を再表示
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



