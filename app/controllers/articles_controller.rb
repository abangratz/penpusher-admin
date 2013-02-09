class ArticlesController < ApplicationController
    class Article < SimpleDelegator
      extend ActiveModel::Naming
    end

  def index
    @articles = [Article.new(OpenStruct.new(title: 'Test', body: 'First!!11!!!eleventy'))]
  end
end
