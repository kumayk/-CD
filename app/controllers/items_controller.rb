class ItemsController < ApplicationController
	PER = 8

  def index
  	@items =  Item.order("RANDOM()").limit(8)
  end

  def search
  	@items = Item.page(params[:page]).per(PER)
  end

  def show
  	@item = Item.find(params[:id])
  	@review = Review.new
  	@review.item_id = @item.id
  	@reviews = Review.all
  end

  def create
  end

  private
    # def review_params
    #   params.require(:review).permit(:review_comment, :item_id, :user_id)
    # end
     def item_params
     	params.require(:item).permit(:user_id, :item_id, :review_comment)
     end

end

