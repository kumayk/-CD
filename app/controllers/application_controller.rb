class ApplicationController < ActionController::Base
<<<<<<< HEAD
  before_action :set_search

  def set_search
	@search = Item.ransack(params[:id])
  	@result = @search.result
  end

  private
  def  search_params
  	params.require(:search).permit(:disk_name, :disk_image, :stock, :price, :item_status)
  end
=======
	before_action :configure_permitted_parameters, if: :devise_controller?


	protected

	def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number])
	devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
	devise_parameter_sanitizer.permit(:account_update,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number])
	end
>>>>>>> a9e5f7c2e9711cfa3b5e75647557b90a74906164
end
