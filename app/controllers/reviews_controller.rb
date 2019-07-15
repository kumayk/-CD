class ReviewsController < ApplicationController

def new
end

def create
    @item = Item.find(params[:id])
    @review = Review.new(review_params)
    # @item.user_id = current_user.id
    @review.save
      # redirect_to '/items'
    # end
end

def update
end

def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      render items_path
    end
end

private
    def review_params
      params.require(:review).permit(:review_comment)
    end
end