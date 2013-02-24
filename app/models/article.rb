class Article

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :title, :body, :persisted

  attr_reader :errors

  validates_presence_of :title, :body

  def initialize(params={})
    @errors = ActiveModel::Errors.new(self)
    self.title = params[:title]
    self.body = params[:body]
  end

  def slug
    title && title.parameterize
  end

  def id 
    slug
  end

  def persisted?
    self.persisted
  end

  def self.model_name
    ActiveModel::Name.new(self)
  end

end
