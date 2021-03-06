class ArticlesController < ApplicationController
  attr_writer :blog

  def index
    @articles = blog.entries
  end

  def show
    @article = blog.retrieve_article(params[:id])
  end

  def edit
    @article = blog.retrieve_article(params[:id])
  end

  def blog
    Rails.application.config.blog_admin
  end

  def new
    @article = blog.new_article
  end

  def create
    @article = blog.create_article(params[:article][:title], params[:article][:body])
    if @article.persisted?
      redirect_to articles_path, notice: "The article has been successfully saved."
    else
      render action: :new, notice: "Article is not valid"
    end
  end

  def update
    @article = blog.update_article(params[:id], params[:article][:title], params[:article][:body])
    if @article.persisted?
      redirect_to articles_path, notice: "The article has been successfully saved."
     else
       render action: :edit, notice: "Article is not valid"
    end
  end


end
