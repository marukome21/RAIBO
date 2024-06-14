class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    #まだバリデーション設定してないので名前がからっぽでも編集できちゃいます！
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)#, notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = post.user_id
    post.delete
    redirect_to admin_user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :profile, :email, :is_active)
  end

  def post_params #postのストロングパラメータ
    params.require(:post).permit(:post_text, :image) #パラメーターのキー
  end

end
