class UsersController < ApplicationController
	before_action :authenticate_user

def show
	@user = User.find(current_user.id)
	# @shipping_address = current_user.shipping_addresses
end

def edit
end

def update
end

end
