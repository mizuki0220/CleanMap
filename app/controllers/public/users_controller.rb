class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:show, :edit, :update, :withdraw]
  before_action :guest_check, only: [:edit, :update, :withdraw]

  def mypage
    @user = User.find(params[:id])
    @posts = @user.posts
    @post_genres = PostGenre.where(id: @posts.pluck(:post_genre_id)).uniq
    @comments = @user.comments
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
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

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


 private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to mypage_user_path(current_user.id)
    end
  end

  def guest_check
    if current_user == User.guest
      redirect_to mypage_user_path(current_user.id), notice: 'ゲストユーザーはアクセスできません。'
    end
  end

end
