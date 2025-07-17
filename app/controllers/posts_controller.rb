class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update]
  before_action :authorize_user!, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Пост успешно создан!"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end


  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Пост обновлён!"
    else
      render :edit
    end
  end

  def my_posts
    @posts = current_user.posts.order(created_at: :desc)
  end

  def feed
    @posts = current_user.feed
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "Нет доступа" unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
