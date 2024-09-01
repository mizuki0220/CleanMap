class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    if params[:genre]
     @genre = params[:genre]
     @posts = Post.joins(:post_genre).where(post_genres: { name: @genre })
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @genre = @post.post_genre.name
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Successfully submitted!"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_genre_id, images: [])
  end

end
