class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_root_path     # 管理者ログイン後のリダイレクト先
    else
      posts_path
    end
  end
end
