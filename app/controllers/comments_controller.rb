class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    render :comment
  end

  def desrtroy
    @post = Post.find(params[:id])
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    render :comment
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
