class ItemsController < ApplicationController

  def index
  	@items =  Item.order("RANDOM()").limit(4)
  end

  def search
  end
  
  def show
  end

end