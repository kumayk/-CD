class AdminOrdersController < ApplicationController
before_action :authenticate_admin
def index
	@orders = Order.with_deleted.all
end

def show
	@order = Order.with_deleted.find(params[:id])
end

def update
	order = Order.find(params[:id])
	order.update(order_params)
	redirect_to admin_order_path(order.id)
end

def destroy
end

def edit
end

private
  def order_params
     params.require(:order).permit(:order_status)
  end

end
