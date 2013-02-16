class BlogAdmin

  attr_reader :entries

  attr_accessor :article_creator_method

  def initialize(article_creator_method=Article.method(:new))
    @entries = []
    self.article_creator_method = article_creator_method
  end


  def create_article(title, body)
    article = self.article_creator_method.(title: title, body: body)
    @entries << article
    article
  end

end