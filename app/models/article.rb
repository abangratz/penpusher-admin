class Article

  extend ActiveModel::Naming

  attr_accessor :title, :body

  attr_reader :errors

  def initialize(params={})
    @errors = ActiveModel::Errors.new(self)
    self.title = params[:title]
    self.body = params[:body]
  end

end
