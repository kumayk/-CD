class ItemsController < ApplicationController
	PER = 8

  def index
  	@items =  Item.order("RANDOM()").limit(4)
  end

  def search
  	@items = Item.page(params[:page]).per(PER)
  end

  def show
  end

end
