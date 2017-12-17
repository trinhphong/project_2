class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    if user.destroy
      redirect_to users_path
    end
  end

  def generate_new_password_email
    user = User.find(params[:user_id])
    user.send_reset_password_instructions
    redirect_to users_path(user)
  end
end
