class Admin::UsersController < ApplicationController
  layout 'admin'

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post_genres = PostGenre.where(id: @posts.pluck(:post_genre_id)).uniq
  end

  def user_posts
    @post = Post.find(params[:post_id])
    @user = @post.user
    @genre = @post.post_genre.name
  end

  def delete_post
    post = Post.find(params[:id])
    @user = post.user
    post.destroy
    redirect_to admin_user_path(@user), notice: "投稿を削除しました。"
  end

  def delete_comment
    post = Post.find(params[:post_id])
    Comment.find(params[:id]).destroy
    redirect_to user_posts_admin_user_path(post_id: post.id), notice: "コメントを削除しました。"
  end


private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
