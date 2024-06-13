class Public::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path
  end

  def unsubscribe

  end

  def withdraw
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :profile, :user_image, :email, :encrypted_password)
  end
end
