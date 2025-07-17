class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    current_user.likes.create(post: post) unless current_user.likes.exists?(post: post)
    redirect_back fallback_location: post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post: post)
    like&.destroy
    redirect_back fallback_location: post_path(post)
  end
end
