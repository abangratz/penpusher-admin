require 'spec_helper'

describe Blog do

  subject { Blog.new }
  let(:article) { mock("Article") }
  let(:articles) { [article] }

  it "returns a list of articles" do
    subject.articles = articles
    subject.articles.should eq(articles)
  end
  it "adds an article to articles" do
    subject.add_article(article)
    subject.articles.should include(article)
  end

end
