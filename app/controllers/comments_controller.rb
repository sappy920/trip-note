class CommentsController < ApplicationController
  before_action :set_article
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
        redirect_to articles_path
    else
        redirect_to root_path
    end
  end


  def destroy
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      redirect_to article_path(@article)
    else
      render article_path(@article)
    end
  end

  

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
