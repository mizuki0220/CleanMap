class PostGenresController < ApplicationController
  def index
    @post_genre = PostGenre.new
    @post_genres = PostGenre.all
  end

  def create
    @post_genre = PostGenre.new(post_genre_params)
    if @post_genre.save
      redirect_to post_genres_path, notice: "登録しました"
    else
      @post_genres = PostGenre.all
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
