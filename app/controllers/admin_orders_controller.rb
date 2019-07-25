class AdminOrdersController < ApplicationController
before_action :authenticate_admin
def index
	@orders = Order.page(params[:page]).reverse_order
end

def show
	@order = Order.find(params[:id])
end

def update
end

def destroy
end

def edit
end

end
