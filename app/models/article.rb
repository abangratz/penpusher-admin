class Article

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :title, :body, :html_body

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
  
  def body=(value)
    self.html_body = Kramdown::Document.new(value).to_html if value
    @body = value
  end

  def self.model_name
    ActiveModel::Name.new(self)
  end

end
