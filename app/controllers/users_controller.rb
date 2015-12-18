class UsersController < ApplicationController
  # before_action :authenticate_user!, except: [:show]

  def show
    @user = current_user
    @regapp = current_user.regapps.find(params[:id])
    @regapps = @user.regapps
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information has been updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
