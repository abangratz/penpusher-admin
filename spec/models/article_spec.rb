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
end