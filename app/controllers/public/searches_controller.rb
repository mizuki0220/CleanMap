class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end

    if @users.present? || @posts.present?
      render "public/searches/search_results"
    else
      render "public/searches/no_results"
    end
  end
end
