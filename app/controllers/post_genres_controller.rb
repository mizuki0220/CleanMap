class PostGenresController < ApplicationController
  def index
    @post_genre = PostGenre.new
    @post_genres = PostGenre.all
  end

  def create
    @post_genre = PostGenre.new(post_genre_params)
    if @post_genre.save!
      flash[:notice] = "正常に登録しました"
      redirect_to post_genres_path
    else
      @post_genres = PostGenre.all
      flash[:alert] = "登録に失敗しました"
      render :index
    end
  end

  def edit
  end

  def update
  end

  private
  def post_genre_params
    params.require(:post_genre).permit(:name)
  end
end
