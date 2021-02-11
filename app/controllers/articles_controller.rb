class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  private


  def article_params
    params.require(:article).permit(:instruction, :category_id, :country_id, :image).merge(user_id: current_user.id)
  end
end
