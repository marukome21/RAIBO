class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user_post, only: [:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path #renderによるURLエラーの対策
    end
  end

  def index
    @posts = Kaminari.paginate_array(Post.all.reverse).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end



  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params #postのストロングパラメータ
    params.require(:post).permit(:post_text, :image) #パラメーターのキー
  end

  def is_matching_login_user_post
    post = Post.find(params[:id])
    unless post.user.id == current_user.id
      redirect_to posts_path
    end
  end

end
