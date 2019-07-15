class ItemsController < ApplicationController

  def index
  end

  def show
  	@review = Review.new
  	@reviews = Review.all
  	@user = User.find_by(id: params[:id])
  end

  def create
  end

  private
    def review_params
      params.require(:review).permit(:review_comment, :item_id, :user_id)
    end

end