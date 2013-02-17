class Article

  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :title, :body

  attr_reader :errors

  def initialize(params={})
    @errors = ActiveModel::Errors.new(self)
    self.title = params[:title]
    self.body = params[:body]
  end

  def persisted?
    false
  end

  def self.model_name
    ActiveModel::Name.new(self)
  end

end
