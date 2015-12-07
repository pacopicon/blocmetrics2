class RegappsController < ApplicationController

  def index
    @regapps = current_user.regapps.paginate(page: params[:page])
  end

  def show
    @regapp = current_user.regapps.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @regapps = @user.regapps

    @regapp = Regapp.new(regapp_params)
    @regapp.user = current_user
    @new_regapp = Regapp.new

    if @regapp.save
      flash[:notice] = "Application was successfully saved"
    else
      flash[:error] = "The application could not be saved.  Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @regapp = current_user.regapps.find(params[:id])

    if @regapp.destroy
      flash[:notice] = "\"#{@regapp.name}\" has successfully been deleted."
      redirect_to users_path
    else
      flash[:error] = "There was an error deleting this application. Please try again!"
      render :show
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def regapp_params
    params.require(:regapp).permit(:name, :url)
  end
end
