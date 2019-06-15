class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    #redirect_to "messages/index"
  end
  def update
    #@user1 = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:email)
  end
end
