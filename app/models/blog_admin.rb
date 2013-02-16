class BlogAdmin

  attr_reader :entries

  def initialize
    @entries = []
  end

  def create_article(title, body)
    article = OpenStruct.new(title: title, body: body)
    @entries << article
    article
  end

end
