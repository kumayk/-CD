class ItemsController < ApplicationController
	PER = 8

  def index
  	@items =  Item.order("RANDOM()").limit(4)
  end

  def search
  	@items = Item.page(params[:page]).per(PER)
  end

  def show
  	@cart = CartDetail.new
  	@item = Item.find(params[:id])
  	@review = Review.new
  	@reviews = @item.reviews
  	@current_stock = []
  	@item.stock.times do |quantity|
	  	if quantity < 100
	  	  @current_stock << quantity + 1
	  	else
	  	  break
	  	end
   	end
  end

  def create
  end

  private
     def item_params
     	params.require(:item).permit(:user_id, :item_id, :review_comment, :image,
     	                             :disk_name, :image_id, :stock, :price, :item_status,
     	                             :artist_id, :label_id, :category_id, :disk_id,
     	                              artists_attributes: [:id, :artist_name],
     	                              disks_attributes: [:id, :disk_name], songs_attributes: [:id, :song_name, :truck_number],
     	                              lavels_attributes: [:id, :lavel_name], categories_attributes: [:id, :category_name])
     end

end

