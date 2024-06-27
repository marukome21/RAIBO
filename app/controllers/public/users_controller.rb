class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :update, :unsubscribe, :withdraw]  #before_actionでeditアクション実行前に処理を行う

  def show
    @user = User.find(params[:id])
    @posts = Kaminari.paginate_array(@user.posts.all.reverse).page(params[:page]).per(10)
  end

  def edit
    @user = current_user
    unless current_user.id == @user.id
      redirect_to request.referer
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path(current_user.id)
    else
      redirect_to edit_users_information_path
    end
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

  def ensure_guest_user
    user = (current_user)
    if user.user_name == "guestuser"
      redirect_to users_my_page_path(current_user) #, notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end