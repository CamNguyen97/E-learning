class ProfilesController < ApplicationController

  def index
  	@user = User.find_by id: current_user.id
  end

  def edit
  	@userprofile = User.find_by id: params[:id]
  end

  def update
  	@userprofile = User.find_by id: params[:id]
  	if @userprofile.update_attributes profile_param
  		redirect_to profiles_path
  	else
  		redirect_to :edit
  	end
  end

  private

  def profile_param
  	params.require(:user).permit :email, :name, :dateOfbirth, :phone, :address
  end
end
