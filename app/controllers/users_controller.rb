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
=======



>>>>>>> 542116da9a6b711a7206559f9596d50a4dad5c43
    private

    def user_params
        params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email, :password, :password_confirmation)
    end
end

