class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    if params[:post_genres_id]
      @post_genre = PostGenre.find(params[:post_genres_id])
      @posts = @post_genre.posts.order(created_at: :desc).all
    else
      @posts = Post.order(created_at: :desc).all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Successfully submitted!"
      redirect_to :show
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
    params.require(:post).permit(:title, :body, images: [], post_genres_id: [])
  end

end
