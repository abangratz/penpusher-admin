require 'spec_helper'

describe BlogAdmin do
  let(:article) { OpenStruct.new(title: nil, body: nil)  }
  let(:article_creator_method)  { 
    ->(params) { 
      article.title = params[:title]
      article.body = params[:body]
      article 
    } 
  }
  subject { BlogAdmin.new(article_creator_method) }
  it "creates an article from a title and body" do
    subject.create_article('title', 'body')
      .should eq(article)
  end

  it "adds the newly created article to entries" do
    subject.create_article('title', 'body')
    subject.entries.should include(article)
  end

end
