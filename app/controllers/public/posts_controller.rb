class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)       #データを新規登録するためのインスタンス生成
    if @post.save                                       #データをデータベースに保存するためのsaveメソッド実行
      redirect_to action: 'index'                       #トップ画面へリダイレクト
    else
      render 'new'
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

end
