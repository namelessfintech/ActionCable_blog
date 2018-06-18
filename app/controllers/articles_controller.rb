class ArticlesController < ApplicationController
  before_action :find_id, only:[:show]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end

  def show

  end

  protected

    def resource_not_found
      message = "The article you are looking for could not be found"
      flash[:alert] = message
      redirect_to root_path

    end

  private

  def article_params
    params.require(:article).permit(:title, :body)

  end

  def find_id
    @article = Article.find(params[:id])
  end
end
