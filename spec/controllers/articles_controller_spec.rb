require 'spec_helper'

describe ArticlesController do
  context "GET /index" do
    let(:articles) { [] }
    let(:blog) { OpenStruct.new(entries: articles) }
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
  
  context " GET /new" do
    let(:article) { mock_model(Article, title: 'test', body: 'testbody') }
    let(:blog) { mock(BlogAdmin)}
    before(:each) do
      BlogAdmin.should_receive(:new).and_return(blog)
      blog.should_receive(:create_article).with('test', 'testbody')
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

  context "#blog" do
    it "returns the blog instance" do
      controller.blog.should be_a(BlogAdmin)
    end

    it "caches the blog instance" do
      the_blog = controller.blog
      the_blog.should_not be_nil
      controller.blog.should == the_blog
    end

  end

end
