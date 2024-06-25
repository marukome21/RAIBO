class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:top]


  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path     # 管理者ログイン後のリダイレクト先
    else
      posts_path
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end
end
