class Article

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :title, :body, :html_body, :body_creator_method

  attr_reader :errors

  validates_presence_of :title, :body

  def initialize(params={})
    @errors = ActiveModel::Errors.new(self)
    self.title = params[:title]
    self.body = params[:body]
  end

  def persisted?
    false
  end
  
  def body=(value, body_creator_method=Kramdown::Document.method(:new))
    self.body_creator_method = body_creator_method
    self.html_body = body_creator_method.(value).to_html if value
    @body = value
  end

  def self.model_name
    ActiveModel::Name.new(self)
  end

end
