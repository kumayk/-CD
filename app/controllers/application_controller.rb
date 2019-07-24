class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def authenticate_user
    unless current_user
      flash[:notice] = "ログインが必要です"
      redirect_to new_user_registration_url
    end
  end

  def set_search
	  @search = Item.ransack(params[:q])
  	@result = @search.result

  end

  #binding.pry
  # private
  #   def search_params
  # 	params.require(:search).permit(:disk_name, :disk_image, :stock, :price, :item_status)
  #   end

  protected
    def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number])
	  devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
	  devise_parameter_sanitizer.permit(:account_update,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number])
    end

end



Refile.secret_key = '25800294522430a4226af5ef5c0c80d748dcc9b32580e282bed66b7e88583b5e4345d13cbcba6578fc2ca9ff8d307f6c2f7cd0411582518e09dbb5cc6d18e2de'
