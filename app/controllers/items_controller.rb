class ItemsController < ApplicationController

  def index
  	@items =  Item.order("RANDOM()").limit(4)
  end

  def show
  end

  def search
  end


end
