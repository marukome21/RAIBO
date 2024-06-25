class Public::LikesController < ApplicationController


  def index
    @user = User.find(params[:user_id])
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Kaminari.paginate_array(Post.find(likes).reverse).page(params[:page]).per(2)
  end

  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: post.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: post.id)
    like.destroy
    redirect_to request.referer
  end


end
