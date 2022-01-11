class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
    render :comment
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    render :comment
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
