class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit, :favorites]

  def index
    @users = User.all
    @post = Post.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_post = Post.find(favorites)
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'ユーザー情報の更新に成功しました'
    else
      render 'edit'
    end
  end

  def quit;
  end

  def out
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = 'ありがとうございました。またのご利用を心よりお待ちしております。'
    redirect_to root_path
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless @user == current_user
  end
end
