class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: "Комментарий добавлен"
    else
      redirect_to post_path(@post), alert: "Ошибка при добавлении комментария"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to post_path(@comment.post), notice: "Комментарий удалён"
    else
      redirect_to post_path(@comment.post), alert: "Вы не можете удалить этот комментарий"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    redirect_to post_path(@comment.post), alert: "Нет доступа" unless @comment.user == current_user
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to post_path(@comment.post), alert: "Нет доступа"
      return
    end

    if @comment.update(comment_params)
      redirect_to post_path(@comment.post), notice: "Комментарий обновлён"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
