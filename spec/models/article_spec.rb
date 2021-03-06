require 'spec_helper'

describe Article do
  context "#new" do
    it "takes title and body as hash arguments" do
      article = Article.new(title: "the title", body: "the body")
      article.title.should eq('the title')
      article.body.should eq('the body')
    end
    it "takes no arguments" do
      expect { Article.new }.not_to raise_error
    end
  end
  context "#errors" do
    subject { Article.new }
    it "responds to 'errors'" do
      subject.should respond_to(:errors)
    end
    it "must be an ActiveModel::Errors collection" do
      subject.errors.should be_a(ActiveModel::Errors)
    end
  end
  context "#persisted?" do
    subject { Article.new }
    it "can be set" do
      subject.should_not be_persisted
      subject.persisted = true
      subject.should be_persisted
    end
  end
  
  context "formatting" do
    subject { Article.new }
    it "converts markdown syntax in the body" do
      subject.body =<<-EOS
#H1

Paragraph

##H2

Another Paragraph
      EOS
      html =<<-EOS
<h1 id="h1">H1</h1>

<p>Paragraph</p>

<h2 id="h2">H2</h2>

<p>Another Paragraph</p>
      EOS
      subject.html_body.should eq(html)
    end
  end

  context "including/extending" do
    it "includes ActiveModel::Conversion" do
      Article.ancestors.include? ActiveModel::Conversion
    end
  end

  context "validating" do
    subject { Article.new }
    it "checks the presence of the body" do
      subject.title = 'something'
      subject.body = nil
      subject.should_not be_valid
    end
    it "checks the presence of the title" do
      subject.title = nil
      subject.body = 'something'
      subject.should_not be_valid
    end
  end

  context "slug" do
    subject { Article.new }
    it "returns a slug built from the title" do
      subject.title = 'the title'
      subject.slug.should eq('the-title')
    end
    it "returns nil if the title is empty" do
      subject.title = nil
      subject.slug.should be_nil
    end
    it "returns the slug for to_param if persisted" do
      subject.title = 'another title'
      subject.persisted = true
      subject.to_param.should eq(subject.slug)
    end
    it "returns nil for to_param if not persisted" do
      subject.title = 'another title'
      subject.persisted = false
      subject.to_param.should be_nil
    end
  end

  context ".model_name" do
    subject { Article }
    it "returns a genuine ActiveModel::Name" do
      subject.model_name.should be_a(ActiveModel::Name)
    end
  end
  
  context ".create" do
    subject { Article }
    it "returns a new article" do
      subject.create.should be_a(Article)
    end
    it "does not set persisted" do
      subject.create(title: "title", body: 'not nil').persisted?.should be_nil
      # Explicit check for nil: refactoring changed api
    end
  end
  context "#persist" do
    subject { Article }
    it "sets persisted to true if the article is valid" do
      result = subject.create(title: "title", body: 'not nil')
      result.persist
      result.should be_persisted
    end
    it "sets persisted to false if the article is invalid" do
      result = subject.create(title: "title", body: nil)
      result.persist
      result.persisted?.should be_false
    end
  end
end
