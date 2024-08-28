class UsersController < ApplicationController
  def mypage
    @user = current_user
    @posts = Post.all
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
end
