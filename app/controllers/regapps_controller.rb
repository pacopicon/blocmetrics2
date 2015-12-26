class RegappsController < ApplicationController

  def index
    @regapps = current_user.regapps.paginate(page: params[:page])
  end

  def show
    @user = current_user
    # @regapp = current_user.regapps.find(params[:id])
    @events = @regapp.events.group(:name)

  end

  def new
    @regapp = Regapp.new
  end

  def edit
    @regapp = current_user.regapps.find(params[:id])
  end

  def update
    @regapp = Regapp.find(params[:id])
    if @regapp.update_attributes(regapp_params)
      flash[:notice] = "the application was updated."
      redirect_to @user.regapp
    else
      flash[:error] = "there was an error saving the application.  Please try again!"
      render :edit
    end
  end

  def create
    @user = current_user
    @regapp = current_user.regapps.build(regapp_params)
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
    else
      flash[:error] = "There was an error deleting this application. Please try again!"
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
