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
    it "is never persisted" do
      subject.should_not be_persisted
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

  context ".model_name" do
    subject { Article }
    it "returns a genuine ActiveModel::Name" do
      subject.model_name.should be_a(ActiveModel::Name)
    end
  end
end
