class Article

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :title, :body, :persisted, :html_body, :body_creator_method

  attr_reader :errors

  validates_presence_of :title, :body

  validates_each :title do |record, attr, value|
    record.errors.add attr, 'must be unique' if BlogAdmin.instance.retrieve_article(record.slug)
    #TODO: More indirection, less coupling
  end

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
  
  def body=(value, body_creator_method=Kramdown::Document.method(:new))
    self.body_creator_method = body_creator_method
    self.html_body = body_creator_method.(value).to_html if value
    @body = value
  end

  def self.model_name
    ActiveModel::Name.new(self)
  end

  def self.create(*args)
    Article.new(*args)
  end

  def persist
    self.persisted = self.valid?
  end

end
