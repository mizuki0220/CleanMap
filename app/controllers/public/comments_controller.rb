class Public::CommentsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end


  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.build(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
    comment = Comment.find(params[:post_id])
    comment.destroy
    redirect_to post_path(comment.post_id), notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end

end
