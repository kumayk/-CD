class UsersController < ApplicationController

def show
end

def edit
end

def update
end

private
def uesr_params
  params.require(:user).permit(:review)

end
