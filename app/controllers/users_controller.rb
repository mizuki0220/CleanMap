class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def mypage
    @posts = current_user.posts
    @post_genres = PostGenre.where(id: @posts.pluck(:post_genre_id)).uniq
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報の更新が完了しました。"
      redirect_to mypage_user_path(current_user.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
  end

    private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
