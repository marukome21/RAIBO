# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController


  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path#, notice: 'guestuserでログインしました。'#フラッシュメッセージ
  end

  def destroy
    reset_guest_data if current_user.email == "guest@example.com"
    super
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
