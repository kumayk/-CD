class ItemsController < ApplicationController

  def index
  	@items =  Item.order("RANDOM()").limit(4)
  end

  def search
  	@item = Item.all
  end
  
  def show
  end

<<<<<<< HEAD
  def search
  end


=======
>>>>>>> aki/master
end
