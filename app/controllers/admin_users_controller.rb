class AdminUsersController < ApplicationController
    before_action :authenticate_admin

	PER = 8

    def index
	  @customer = User.with_deleted.all.page(params[:page]).per(8)
    end

    def show
      @user = User.with_deleted.find(params[:id])
      @order = Order.where(user_id: @user.id)
    end

    def edit
	  @user = User.with_deleted.find(params[:id])
    end

    def update
	  user = User.find(params[:id])
	  user.update(user_params)
	  redirect_to admin_user_path(user.id)
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        user.update(email: user.deleted_at.to_i.to_s + '_' + user.email.to_s)
        redirect_to admin_users_path
    end

    private

    def user_params
        params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email, :password)
    end
end
