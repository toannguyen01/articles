class ArticlesController < ApplicationController
  before_action :get_articles, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
    @articles_att = (@article.postimages + @article.posttexts).sort_by &:order_show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    return redirect_to articles_url, notice: 'You have sucsessfully created the article' if @article.save
    flash[:alert] = 'An Error'
    render :new    
  end

  def edit
    render :new
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Update sucessfully'
      redirect_to articles_url
    else
      flash[:notice] = 'Update error'
      render :new
    end 
  end

  def destroy
    if  @article.destroy
      flash[:notice] = 'Destroy sucessfully'
        redirect_to articles_url
    else
      flash[:notice] = 'Destroy error'
        redirect_to articles_url
    end
  end

  private
  def get_articles
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :published, :like)
  end

end