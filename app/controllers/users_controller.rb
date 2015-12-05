class UsersController < ApplicationController
  def edit
    @localities = Locality.all
  end

  def update
    current_user.update_attributes(user_params)
    if current_user.profile_incomplete?
      flash[:alert] = "Please fill all the details"
      redirect_to edit_user_path(current_user)
    else
      redirect_to root_path
    end
  end

private
  def user_params
    params.require(:user).permit(:locality_id, :type_of_help, :phone)
  end
end
