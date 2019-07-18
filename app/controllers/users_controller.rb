class UsersController < ApplicationController
	before_action :authenticate_user

	def show
		@user = User.find(current_user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
	    user.update(user_params)
	    sign_in(user, bypass: true)
	    redirect_to user_path(user.id)
	end



<<<<<<< HEAD
    private
    def user_params
        params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email, :password, :password_confirmation)
    end
=======
private
def uesr_params
  params.require(:user).permit(:review)

>>>>>>> aki/master
end
