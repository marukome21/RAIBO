class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :unsubscribe, :withdraw]

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
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    #flash[:withdraw] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :profile, :user_image, :email, :encrypted_password)
  end
end
