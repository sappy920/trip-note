class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :birthday, :profile, :profile_image)
  end
end  

