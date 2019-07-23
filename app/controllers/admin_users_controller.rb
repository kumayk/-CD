class AdminUsersController < ApplicationController
	PER = 8

    def index
	  @customer = User.all.page(params[:page]).per(8)
    end

    def show
      @orders = Oder.find(current_user.id)
    end

    def edit
	  @user = User.find(params[:id])
    end

    def update
	  user = User.find(params[:id])
	  user.update(user_params)
	  sign_in(user, bypass: true)
	  redirect_to admin_user_path(user.id)
    end

    def destroy
        resource.destroy
        resource.update(email: resource.deleted_at.to_i.to_s + '_' + resource.email.to_s)
        redirect_to admin_users_path
    end

    private

    def user_params
        params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email, :password)
    end
end
