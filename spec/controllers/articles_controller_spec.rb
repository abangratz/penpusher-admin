require 'spec_helper'

describe ArticlesController do
  let(:articles) { [] }
  let(:blog) { OpenStruct.new(entries: articles) }
  before(:each) do
    Rails.application.config.blog_admin = blog
  end
  context "GET /index" do
    before(:each) do
      controller.blog = blog
    end
    it "succeeds" do
      get :index
      response.should be_success
    end

    context "retrieving articles" do
      it "retrieves the articles from a blog instance" do
        get :index
      end

      it "sets the articles as @articles" do
        get :index
        assigns(:articles).should eq(articles)
      end

    end

  end
  
  context "GET /new" do
    let(:article) { mock_model(Article, title: nil, body: nil) }
    before(:each) do
      blog.should_receive(:new_article)
        .and_return(article)
    end
    it "succeeds" do
      get :new
      response.should be_success
    end

    it "sets a newly created article as @article" do
      get :new
      assigns(:article).should eq(article)
    end
  end

  context "POST /articles" do
    it "creates a new article via blog" do
      blog.should_receive(:create_article).with("the title", "the body").and_return(true)
      post :create, {article: {title: "the title", body: "the body"}}
      response.should redirect_to "/articles"
    end
  end

  context "#blog" do
    it "returns the blog instance" do
      controller.blog.should eq(blog)
    end
  end

end
