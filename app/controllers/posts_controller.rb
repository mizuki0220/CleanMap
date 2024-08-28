class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
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
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:post).permit(:title, :body)
  end


end
