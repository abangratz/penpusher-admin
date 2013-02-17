class Blog

  attr_accessor :articles

  def initialize
    @articles = []
  end

  def add_article(new_article)
    @articles << new_article
  end

end
