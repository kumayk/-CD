class AdminUsersController < ApplicationController

def index
	@customer = User.all
end

def show
	@user = User.find(current_user.id)
end

def edit
end

def destroy
end

def update
end

end
