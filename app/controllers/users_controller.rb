class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:role_id, :name, :email)
    end
end