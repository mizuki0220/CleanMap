class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post_genres = PostGenre.where(id: @posts.pluck(:post_genre_id)).uniq
  end

  def user_posts
    @post = Post.find(params[:post_id])
    @user = @post.user
    @genre = @post.post_genre.name
    @comment = Comment.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: '削除しました。'
  end


private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
