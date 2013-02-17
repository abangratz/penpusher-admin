require 'spec_helper'

describe BlogAdmin do
  subject { BlogAdmin.instance }
  let(:article) { OpenStruct.new(title: nil, body: nil)  }
  let(:article_creator_method)  { 
    ->(params) { 
      article.title = params[:title]
      article.body = params[:body]
      article 
    } 
  }

  context "#create_article" do
    before(:each) do
      BlogAdmin.instance.article_creator_method = article_creator_method
      article.stub!(:valid? => true)
    end
    it "creates an article from a title and body" do
      subject.create_article('title', 'body')
      .should eq(article)
    end

    it "adds the newly created article to entries" do
      subject.create_article('title', 'body')
      subject.entries.should include(article)
    end

    it "does not add an invalid article to entries" do
      article.stub!(:valid? => false)
      subject.create_article('title', nil)
      subject.entries.should_not include(article)
    end
  end

  context "#new_article" do
    it "creates a new article without title and body" do
      new_article = subject.new_article
      new_article.should eq(article)
      article.body.should be_nil
      article.title.should be_nil
    end
  end

end
