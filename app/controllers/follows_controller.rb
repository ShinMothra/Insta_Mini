class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    current_user.following << user unless current_user.following.include?(user)
    redirect_to user_path(user), notice: "Вы подписались на #{user.email}"
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.following.destroy(user)
    redirect_to user_path(user), notice: "Вы отписались от #{user.email}"
  end
end
