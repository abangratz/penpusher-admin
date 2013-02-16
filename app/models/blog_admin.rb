class BlogAdmin

  def initialize
    @articles = []
  end

  def create_article(title, body)
    article = OpenStruct.new(title: title, body: body)
    @articles << article
    article
  end

  def entries
    @articles
  end

end
