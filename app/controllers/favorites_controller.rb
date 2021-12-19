class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.destroy
  end

  private
  def post_params
    @post = Post.find(params[:post_id])
  end
end
