class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end



  def article_params
    params.require(:article).permit(:instruction, :category_id, :country_id, :image).merge(user_id: current_user.id)
  end
end
