class Public::CommentsController < ApplicationController
  before_action :is_matching_login_user, only: [:show, :destroy]

  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.build(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post_id), notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id, :evaluation)
  end

  def is_matching_login_user
    comment = Comment.find(params[:id])
    unless comment.user_id == current_user.id
      redirect_to mypage_user_path(current_user.id)
    end
  end

end
