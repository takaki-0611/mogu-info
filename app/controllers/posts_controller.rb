class PostsController < ApplicationController
  before_action :ensure_correct_user, { only: %i[edit update destroy] }

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @new_post = Post.new
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: '投稿完了しました'
    else
      @posts = Post.all
      render 'index'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿の修正が完了しました'
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    redirect_to posts_path if current_user != @post.user
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end
end
