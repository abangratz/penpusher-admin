require 'spec_helper'

describe BlogAdmin do
  context "only one article" do
    subject { BlogAdmin.instance }
    let(:article) { OpenStruct.new(title: nil, body: nil, slug: nil)  }
    let(:article_creator_method)  { 
      ->(params) { 
      article.title = params[:title]
      article.body = params[:body]
      article.slug = params[:title].parameterize if params[:title]
      article 
    } 
    }

    context "#create_article" do
      before(:each) do
        subject.article_creator_method = article_creator_method
        subject.entries = []
        article.stub!(:persist => true)
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
        article.stub!(:persist => false)
        subject.create_article('title', nil)
        subject.entries.should_not include(article)
      end
    end


    context "#retreive_article" do
      let(:article) { OpenStruct.new(title: 'title', slug: 'title') }
      it "returns the matching article from entries" do
        BlogAdmin.instance.entries = [article]
        subject.retrieve_article('title').should == article
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

    context "#update_article" do
      let(:article) { OpenStruct.new(title: 'the title', body: "body", slug: 'the-title') }
      it "returns the matching article from entries" do
        BlogAdmin.instance.entries = [article]
        updated = subject.update_article("the-title", "title", "new_body")
        updated.body.should eq("new_body")
      end
    end
  end
  context "unique titles on multiple articles" do 
    subject { BlogAdmin.instance }
    let(:errors) { double("Errors") }
    let(:first_article) { OpenStruct.new(slug: 'title', body: "first body") }
    let(:second_article) { OpenStruct.new(title: nil, body: nil, slug: nil, errors: errors) }
    let(:article_creator_method) {
        ->(params) {
          second_article.title = params[:title]
          second_article.body = params[:body]
          second_article.slug = params[:title].parameterize if params[:title]
          second_article 
        }
    }
    it "does not add an article to entries if the slug already exists" do
      subject.entries = [first_article]
      subject.article_creator_method = article_creator_method
      errors.should_receive(:add).with("title", "must be unique")
      second_article.stub!(persist: false)
      second_article = subject.create_article('title', 'second body')
      subject.entries.should eq([first_article])
    end
  end
end
