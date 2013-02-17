class ArticlesController < ApplicationController
  attr_writer :blog

  def index
    @articles = blog.entries
  end

  def blog
    Rails.application.config.blog_admin
  end

  def new
    @article = blog.new_article
  end

  def create
    blog.create_article(params[:article][:title], params[:article][:body])
    redirect_to articles_path, notice: "The article has been successfully saved."
  end

end
