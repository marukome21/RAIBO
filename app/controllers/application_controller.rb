class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)    #ログイン先を指定
    if resource.is_a?(Admin)
      admin_root_path                     #管理者側ログインのリダイレクト先
    else
      posts_path                          #ユーザー側ログインのリダイレクト先
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end


  private

  # ゲストユーザーのログアウト後の処理

  def reset_guest_data
    guest_user = User.find_by(email: "guest@example.com")
    guest_user.posts.destroy_all if guest_user.posts.any?
    guest_user.comments.destroy_all if guest_user.comments.any?
    guest_user.followings.destroy_all if guest_user.followings.any?
    guest_user.likes.destroy_all if guest_user.likes.any?
  end

end