class Admin::PostGenresController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @post_genre = PostGenre.new
    @post_genres = PostGenre.all
  end

  def create
    @post_genre = PostGenre.new(post_genre_params)
    if @post_genre.save!
      flash[:notice] = "正常に登録しました"
      redirect_to admin_post_genres_path
    else
      @post_genres = PostGenre.all
      flash[:alert] = "登録に失敗しました"
      render :index
    end
  end

  def edit
    @post_genre = PostGenre.find(params[:id])
  end

  def update
    @post_genre = PostGenre.find(params[:id])
    if @post_genre.update(post_genre_params)
      flash[:notice] = "編集が完了しました。"
      redirect_to admin_post_genres_path
    else
      flash[:alert] = "登録に失敗しました。"
      render :edit
    end
  end

  def destroy
    post_genre = PostGenre.find(params[:id])
    post_genre.destroy
    redirect_to admin_post_genres_path
  end

  private
  def post_genre_params
    params.require(:post_genre).permit(:name)
  end
end
