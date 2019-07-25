class ReviewsController < ApplicationController
before_action :authenticate_user

def new
end

def create
    @item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.item_id = @item.id
    # @item.user_id = current_user.id
    if @review.save
      redirect_to item_path(@review.item_id)
    end
end

def destroy
    review = Review.find(params[:id])
    if review.destroy
      redirect_to item_path(id: review.item_id)
    end
end

private
    def review_params
      params.require(:review).permit(:review_comment, :item_id)
    end
end

