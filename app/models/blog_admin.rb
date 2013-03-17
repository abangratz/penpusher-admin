class BlogAdmin
  include Singleton
  attr_accessor :entries

  attr_accessor :article_creator_method

  def initialize(article_creator_method=Article.method(:create))
    @entries = []
    self.article_creator_method = article_creator_method
  end


  def create_article(title, body)
    article = self.article_creator_method.(title: title, body: body)
    if article.persist
      @entries << article 
    end
    article
  end

  def retrieve_article(id)
    @entries.detect { |entry| entry.slug == id }
  end

  def new_article
    self.article_creator_method.(title: nil, body: nil)
  end
  
  def update_article(slug, title, body)
    article = retrieve_article(slug)
    article.title = title
    article.body = body
    article
  end

end
