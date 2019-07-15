class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
	@search = Item.ransack(params[:id])
  	@result = @search.result
  end

  private
  def  search_params
  	params.require(:search).permit(:disk_name, :disk_image, :stock, :price, :item_status)
  end
end
