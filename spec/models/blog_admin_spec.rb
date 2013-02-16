require 'spec_helper'

describe BlogAdmin do
  subject { BlogAdmin.new }
  it "has many articles" do
    article = OpenStruct.new(title: "Title", body: "Body")
    subject.articles << article
    subject.articles.first.should eq(article)
  end
  it "creates an article from a title and body" do
    subject.create_article('title', 'body')
  end
  it "returns the articles as entries"
end
