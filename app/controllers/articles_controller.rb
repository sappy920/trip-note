class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

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

  def search
    @articles = Article.search(params[:keyword])
  end

  def edit
    if current_user.id != @article.user_id
      redirect_to root_path
    end
  end

  def update
    if @article.update(article_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
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
    params.require(:article).permit(:instruction, :weather, :advice, :category_id, :prefecture_id, :country, :image).merge(user_id: current_user.id)
  end
end
