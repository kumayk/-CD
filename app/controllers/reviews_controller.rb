class ReviewsController < ApplicationController

def new
end

def create
    # @item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    # @reviews = Review,new(review_params)
    # @item.user_id = current_user.id
    # @review.user_id = current_user.id
    @review.save
      redirect_to item_path(id: @review.item_id)
end

def update
end

def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to item_path(id: @review.item_id)
    end
end

private
    def review_params
      params.require(:review).permit(:review_comment, :item_id)
    end
end