class ArticlesController < ApplicationController
  attr_writer :blog

  def index
    @articles = blog.entries
  end

  def blog
    @blog ||= BlogAdmin.new
  end

  def new
    @article = blog.create_article('test', 'testbody')
  end

end
