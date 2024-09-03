class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def mypage
    @posts = current_user.posts
    @post_genres = PostGenre.where(id: @posts.pluck(:post_genre_id)).uniq
  end

  def edit
  end

  def show
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

    private

  def user_params
    params.require(:user).permit(:name)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
