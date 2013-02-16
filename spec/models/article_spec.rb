require 'spec_helper'

describe Article do
  context "#new" do
    it "takes title and body as hash arguments" do
      article = Article.new(title: "the title", body: "the body")
      article.title.should eq('the title')
      article.body.should eq('the body')
    end
  end
end
