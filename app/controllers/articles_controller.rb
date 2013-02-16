class ArticlesController < ApplicationController
  class Article < SimpleDelegator
    extend ActiveModel::Naming
  end

  attr_writer :blog

  def index
    @articles = blog.articles
  end

  def blog
    @blog ||= Blog.new
  end

end
