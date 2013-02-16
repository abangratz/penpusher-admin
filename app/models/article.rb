class Article

  extend ActiveModel::Naming

  attr_accessor :title, :body

  def initialize(params)
    self.title = params[:title]
    self.body = params[:body]
  end

end
